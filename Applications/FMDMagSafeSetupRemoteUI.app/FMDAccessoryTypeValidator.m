@interface FMDAccessoryTypeValidator
+ (id)sharedInstance;
- (BOOL)isAllowedAccessoryWithType:(id)a3;
- (FMDAccessoryTypeValidator)init;
- (NSArray)allowedAccessoryTypes;
@end

@implementation FMDAccessoryTypeValidator

+ (id)sharedInstance
{
  if (qword_100042E20 != -1) {
    dispatch_once(&qword_100042E20, &stru_1000359F0);
  }
  v2 = (void *)qword_100042E18;

  return v2;
}

- (FMDAccessoryTypeValidator)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDAccessoryTypeValidator;
  v2 = [(FMDAccessoryTypeValidator *)&v6 init];
  v3 = v2;
  if (v2)
  {
    allowedAccessoryTypes = v2->_allowedAccessoryTypes;
    v2->_allowedAccessoryTypes = (NSArray *)&off_100039958;
  }
  return v3;
}

- (BOOL)isAllowedAccessoryWithType:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(FMDAccessoryTypeValidator *)self allowedAccessoryTypes];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([v4 isEqualToString:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (NSArray)allowedAccessoryTypes
{
  return self->_allowedAccessoryTypes;
}

- (void).cxx_destruct
{
}

@end