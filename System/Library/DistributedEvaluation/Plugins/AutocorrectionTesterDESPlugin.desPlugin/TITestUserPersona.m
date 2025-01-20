@interface TITestUserPersona
- (CGPoint)userPointForKey:(id)a3;
- (NSDictionary)personaData;
- (NSMutableDictionary)cachedKeyInfo;
- (NSMutableDictionary)keyInfo;
- (TITestUserPersona)initWithPersonaName:(id)a3;
- (UIKBTree)currentKeyplane;
- (void)setCachedKeyInfo:(id)a3;
- (void)setCurrentKeyplane:(id)a3;
- (void)setKeyInfo:(id)a3;
- (void)setPersonaData:(id)a3;
- (void)updateFromKeyplane:(id)a3;
@end

@implementation TITestUserPersona

- (TITestUserPersona)initWithPersonaName:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TITestUserPersona;
  v5 = [(TITestUserPersona *)&v17 init];
  if (v5)
  {
    v6 = sub_2F09C(v4);
    v7 = [v6 pathExtension];
    unsigned int v8 = [v7 isEqualToString:@"plist"];

    if (v8)
    {
      uint64_t v9 = +[NSDictionary dictionaryWithContentsOfURL:v6];
      personaData = v5->_personaData;
      v5->_personaData = (NSDictionary *)v9;
    }
    else
    {
      v11 = [v6 pathExtension];
      unsigned int v12 = [v11 isEqualToString:@"json"];

      if (!v12) {
        goto LABEL_8;
      }
      v13 = +[NSData dataWithContentsOfURL:v6];
      personaData = +[NSJSONSerialization JSONObjectWithData:v13 options:0 error:0];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v5->_personaData, personaData);
      }
    }

LABEL_8:
    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedKeyInfo = v5->_cachedKeyInfo;
    v5->_cachedKeyInfo = v14;
  }
  return v5;
}

- (void)updateFromKeyplane:(id)a3
{
  v5 = (UIKBTree *)a3;
  if (self->_currentKeyplane != v5)
  {
    objc_storeStrong((id *)&self->_currentKeyplane, a3);
    cachedKeyInfo = self->_cachedKeyInfo;
    v7 = [(UIKBTree *)self->_currentKeyplane name];
    unsigned int v8 = [(NSMutableDictionary *)cachedKeyInfo objectForKey:v7];

    if (!v8)
    {
      v50 = v5;
      id v9 = objc_alloc_init((Class)NSMutableDictionary);
      v10 = self->_cachedKeyInfo;
      v11 = [(UIKBTree *)self->_currentKeyplane name];
      [(NSMutableDictionary *)v10 setObject:v9 forKey:v11];

      v47 = [(UIKBTree *)v5 keys];
      id v12 = objc_alloc_init((Class)NSMutableDictionary);
      v89[0] = 0;
      v89[1] = v89;
      v89[2] = 0x5012000000;
      v89[3] = sub_53630;
      v89[4] = nullsub_10;
      v89[5] = &unk_82CF2;
      CGSize size = CGRectZero.size;
      CGPoint origin = CGRectZero.origin;
      CGSize v91 = size;
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472;
      v85[2] = sub_53640;
      v85[3] = &unk_8DB00;
      id v14 = v9;
      id v86 = v14;
      id v49 = v12;
      id v87 = v49;
      v88 = v89;
      [v47 enumerateObjectsUsingBlock:v85];
      uint64_t v79 = 0;
      v80 = &v79;
      uint64_t v81 = 0x3032000000;
      v82 = sub_537D0;
      v83 = sub_537E0;
      id v84 = 0;
      personaData = self->_personaData;
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_537E8;
      v76[3] = &unk_8DB28;
      v77 = v5;
      v78 = &v79;
      [(NSDictionary *)personaData enumerateKeysAndObjectsUsingBlock:v76];
      id v42 = objc_alloc_init((Class)NSMutableDictionary);
      v51 = [(id)v80[5] objectForKey:@"KEYGROUPS"];
      id v48 = objc_alloc_init((Class)NSMutableDictionary);
      id v16 = objc_alloc((Class)NSMutableSet);
      objc_super v17 = [v14 allKeys];
      id v18 = [v16 initWithArray:v17];

      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_538B4;
      v70[3] = &unk_8DBA0;
      v75 = v89;
      unsigned int v8 = (NSMutableDictionary *)v14;
      v71 = v8;
      id v19 = v18;
      id v72 = v19;
      id v20 = v48;
      id v73 = v20;
      id v21 = v42;
      id v74 = v21;
      v46 = v19;
      [v51 enumerateKeysAndObjectsUsingBlock:v70];
      if ([v19 count]) {
        [v21 setObject:v19 forKey:@"OTHERS"];
      }
      id v41 = objc_alloc_init((Class)NSMutableDictionary);
      v22 = [v21 allKeys];
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_54164;
      v68[3] = &unk_8DBC8;
      id v23 = v41;
      id v69 = v23;
      [v22 enumerateObjectsUsingBlock:v68];

      v24 = [(id)v80[5] objectForKey:@"AFFINES"];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_541EC;
      v64[3] = &unk_8DC18;
      id v25 = v23;
      id v65 = v25;
      id v26 = v49;
      id v66 = v26;
      id v27 = v20;
      id v67 = v27;
      v45 = v24;
      [v24 enumerateKeysAndObjectsUsingBlock:v64];
      v28 = [(id)v80[5] objectForKey:@"GLOBALS"];
      v44 = [v28 objectForKey:@"STDDEVXAXISPCT"];

      v29 = [(id)v80[5] objectForKey:@"GLOBALS"];
      v43 = [v29 objectForKey:@"STDDEVYAXISPCT"];

      id v30 = objc_alloc_init((Class)NSMutableDictionary);
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_54A9C;
      v58[3] = &unk_8DC40;
      id v31 = v26;
      id v59 = v31;
      id v32 = v27;
      id v60 = v32;
      id v33 = v30;
      id v61 = v33;
      id v34 = v44;
      id v62 = v34;
      id v35 = v43;
      id v63 = v35;
      [v21 enumerateKeysAndObjectsUsingBlock:v58];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_54C74;
      v52[3] = &unk_8DC90;
      id v36 = v21;
      id v53 = v36;
      id v37 = v25;
      id v54 = v37;
      id v38 = v31;
      id v55 = v38;
      id v39 = v32;
      id v56 = v39;
      id v40 = v33;
      id v57 = v40;
      [(NSMutableDictionary *)v8 enumerateKeysAndObjectsUsingBlock:v52];

      _Block_object_dispose(&v79, 8);
      _Block_object_dispose(v89, 8);

      v5 = v50;
    }
    self->_keyInfo = v8;
  }
}

- (CGPoint)userPointForKey:(id)a3
{
  keyInfo = self->_keyInfo;
  id v4 = [a3 name];
  v5 = [(NSMutableDictionary *)keyInfo objectForKey:v4];

  v6 = [v5 errorGenerator];
  [v6 randomPointInDistribution];
  double v8 = v7;
  double v10 = v9;

  v11 = [v5 rotationMatrix];

  if (v11)
  {
    id v12 = [v5 rotationMatrix];
    objc_msgSend(v12, "transformedPoint:", v8, v10);
    double v8 = v13;
    double v10 = v14;
  }
  [v5 center];
  double v16 = v15;
  [v5 center];
  double v18 = v10 + v17;

  double v19 = v8 + v16;
  double v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (NSDictionary)personaData
{
  return self->_personaData;
}

- (void)setPersonaData:(id)a3
{
}

- (UIKBTree)currentKeyplane
{
  return self->_currentKeyplane;
}

- (void)setCurrentKeyplane:(id)a3
{
}

- (NSMutableDictionary)keyInfo
{
  return self->_keyInfo;
}

- (void)setKeyInfo:(id)a3
{
  self->_keyInfo = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)cachedKeyInfo
{
  return self->_cachedKeyInfo;
}

- (void)setCachedKeyInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedKeyInfo, 0);
  objc_storeStrong((id *)&self->_currentKeyplane, 0);

  objc_storeStrong((id *)&self->_personaData, 0);
}

@end