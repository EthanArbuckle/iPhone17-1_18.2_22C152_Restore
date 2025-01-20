@interface ACTPathWord
- (ACTPathWord)initWithPath:(id)a3 intendedString:(id)a4 keyplane:(id)a5 fromUserData:(BOOL)a6;
- (BOOL)fromUserData;
- (NSString)intendedString;
- (TIContinuousPath)path;
- (TTKKeyboardPlane)keyplane;
- (id)callback;
- (id)description;
- (void)applyWithTyper:(id)a3 log:(id)a4;
- (void)setCallback:(id)a3;
@end

@implementation ACTPathWord

- (ACTPathWord)initWithPath:(id)a3 intendedString:(id)a4 keyplane:(id)a5 fromUserData:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACTPathWord;
  v14 = [(ACTPathWord *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_path, a3);
    v16 = (NSString *)[v12 copy];
    intendedString = v15->_intendedString;
    v15->_intendedString = v16;

    objc_storeStrong((id *)&v15->_keyplane, a5);
    v15->_fromUserData = a6;
  }

  return v15;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(ACTPathWord *)self path];
  v6 = [(ACTPathWord *)self intendedString];
  v7 = [(ACTPathWord *)self keyplane];
  unsigned int v8 = [(ACTPathWord *)self fromUserData];
  CFStringRef v9 = @"NO";
  if (v8) {
    CFStringRef v9 = @"YES";
  }
  v10 = +[NSString stringWithFormat:@"<%@: path=%@, intended=%@, keyplane=%@, fromUserData=%@>", v4, v5, v6, v7, v9];

  return v10;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 isDebugEnabled])
  {
    unsigned int v8 = [v6 getDebugObject:@"PATH_ARRAY"];
    CFStringRef v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = +[NSMutableArray array];
    }
    v22 = v10;

    v23[0] = @"word";
    v21 = [(ACTPathWord *)self intendedString];
    v24[0] = v21;
    v23[1] = @"path";
    v20 = [(ACTPathWord *)self path];
    objc_super v19 = [v20 toJsonDictionary];
    id v11 = [v19 objectForKeyedSubscript:@"samples"];
    v24[1] = v11;
    v23[2] = @"layout";
    id v12 = [(ACTPathWord *)self keyplane];
    id v13 = [(ACTPathWord *)self intendedString];
    v14 = [v12 jsonFrameArrayForWord:v13];
    v24[2] = v14;
    v23[3] = @"userdata";
    v15 = +[NSNumber numberWithBool:[(ACTPathWord *)self fromUserData]];
    v24[3] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    [v22 addObject:v16];

    [v6 addDebugObject:v22 forKey:@"PATH_ARRAY"];
  }
  v17 = [(ACTPathWord *)self path];
  v18 = [(ACTPathWord *)self callback];
  [v7 performStrokeForPath:v17 typingLog:v6 callback:v18];
}

- (TIContinuousPath)path
{
  return self->_path;
}

- (NSString)intendedString
{
  return self->_intendedString;
}

- (TTKKeyboardPlane)keyplane
{
  return self->_keyplane;
}

- (BOOL)fromUserData
{
  return self->_fromUserData;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_intendedString, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end