@interface EmbeddingCacheUtil
+ (id)deserialize:(id)a3;
+ (id)serialize:(id)a3;
@end

@implementation EmbeddingCacheUtil

+ (id)deserialize:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = sub_100012664;
    v36 = sub_100012550;
    id v37 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_100012664;
    v30 = sub_100012550;
    id v31 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_100012664;
    v24 = sub_100012550;
    id v25 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100040D68;
    v15[3] = &unk_1000DAAB0;
    v17 = &v32;
    v18 = &v26;
    v19 = &v20;
    id v16 = v3;
    [v16 enumerateByteRangesUsingBlock:v15];
    v4 = +[NSMutableSet set];
    [v4 addObject:objc_opt_class()];
    [v4 addObject:objc_opt_class()];
    [v4 addObject:objc_opt_class()];
    [v4 addObject:objc_opt_class()];
    [v4 addObject:objc_opt_class()];
    uint64_t v5 = v21[5];
    id v14 = 0;
    v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v4 fromData:v5 error:&v14];
    id v7 = v14;
    if (v7)
    {
      id v8 = 0;
    }
    else
    {
      id v8 = objc_alloc((Class)CSSearchableItemAttributeSet);
      id v9 = objc_alloc((Class)_CSEmbedding);
      id v10 = [v9 initWithEncodedData:v33[5]];
      [v8 setPrimaryTextEmbedding:v10];

      if (v27[5])
      {
        id v11 = objc_alloc((Class)_CSEmbedding);
        id v12 = [v11 initWithEncodedData:v27[5]];
        [v8 setSecondaryTextEmbedding:v12];
      }
      [v8 addAttributesFromDictionary:v6];
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)serialize:(id)a3
{
  id v3 = a3;
  v4 = +[NSData data];
  uint64_t v5 = [v3 primaryTextEmbedding];

  if (v5)
  {
    v6 = [v3 primaryTextEmbedding];
    uint64_t v7 = [v6 encodedData];

    v4 = (void *)v7;
  }
  id v8 = +[NSData data];
  id v9 = [v3 secondaryTextEmbedding];

  if (v9)
  {
    id v10 = [v3 secondaryTextEmbedding];
    uint64_t v11 = [v10 encodedData];

    id v8 = (void *)v11;
  }
  if ([v4 length])
  {
    id v12 = [v3 serializedAttributes];
    uint64_t v18 = 0;
    v13 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v18];
    uint64_t v14 = v18;

    v15 = 0;
    if (!v14 && v13)
    {
      v15 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", [v4 length]+ objc_msgSend(v8, "length")+ objc_msgSend(v13, "length")+ 4);
      unsigned __int16 v17 = (unsigned __int16)[v4 length];
      [v15 appendBytes:&v17 length:2];
      [v15 appendData:v4];
      unsigned __int16 v17 = (unsigned __int16)[v8 length];
      [v15 appendBytes:&v17 length:2];
      if (v17) {
        [v15 appendData:v8];
      }
      [v15 appendData:v13];
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end