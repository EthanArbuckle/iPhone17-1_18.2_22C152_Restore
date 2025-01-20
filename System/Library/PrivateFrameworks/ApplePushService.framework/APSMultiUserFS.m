@interface APSMultiUserFS
+ (id)sharedInstance;
- (APSMultiUserFS)initWithIsMultiUserMode:(BOOL)a3;
- (BOOL)isMultiUser;
- (id)systemPath;
@end

@implementation APSMultiUserFS

+ (id)sharedInstance
{
  if (qword_10015A8B0 != -1) {
    dispatch_once(&qword_10015A8B0, &stru_10012B720);
  }
  v2 = (void *)qword_10015A8B8;
  return v2;
}

- (APSMultiUserFS)initWithIsMultiUserMode:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)APSMultiUserFS;
  result = [(APSMultiUserFS *)&v5 init];
  if (result) {
    result->_isMultiUser = a3;
  }
  return result;
}

- (id)systemPath
{
  systemPathCache = self->_systemPathCache;
  if (!systemPathCache)
  {
    uint64_t v4 = container_system_path_for_identifier();
    if (v4)
    {
      objc_super v5 = (void *)v4;
      v6 = (NSString *)[objc_alloc((Class)NSString) initWithCString:v4 encoding:4];
      v7 = self->_systemPathCache;
      self->_systemPathCache = v6;

      free(v5);
    }
    systemPathCache = self->_systemPathCache;
  }
  v8 = systemPathCache;
  return v8;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (void).cxx_destruct
{
}

@end