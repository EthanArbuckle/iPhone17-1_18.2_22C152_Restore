@interface WFBundledIntentsExtension
- (id)handlerForIntent:(id)a3;
@end

@implementation WFBundledIntentsExtension

- (id)handlerForIntent:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___WFSettingIntent])
  {
    id v4 = (id)objc_opt_new();
  }
  else
  {
    if (qword_100008208 != -1) {
      dispatch_once(&qword_100008208, &stru_1000040B0);
    }
    v5 = (void *)qword_100008200;
    v6 = [v3 identifier];
    v7 = [v5 objectForKeyedSubscript:v6];

    v8 = (void *)qword_100008200;
    if (v7)
    {
      v9 = [v3 identifier];
      id v4 = [v8 objectForKeyedSubscript:v9];
    }
    else
    {
      [(id)qword_100008200 removeAllObjects];
      v10 = (void *)qword_100008200;
      v11 = [v3 identifier];
      if ([v3 _type] == (id)2)
      {
        v12 = [v3 _codableDescription];
        v13 = [v12 typeName];

        +[NSString stringWithFormat:@"WF%@IntentHandler", v13];
      }
      else
      {
        v14 = [v3 _intentInstanceDescription];
        v13 = [v14 name];

        +[NSString stringWithFormat:@"WF%@Handler", v13];
      }
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();

      id v4 = objc_alloc_init(NSClassFromString(v15));
      [v10 setObject:v4 forKeyedSubscript:v11];
    }
  }

  return v4;
}

@end