@interface HDClinicalProviderServiceModel
+ (BOOL)validateContent:(id)a3 error:(id *)a4;
+ (NSString)schemaName;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (HDClinicalProviderServiceModel)init;
- (HDClinicalProviderServiceModel)initWithContent:(id)a3;
- (NSDictionary)content;
- (id)_initWithoutValidatingContent:(id)a3;
- (id)createRawContentWithError:(id *)a3;
- (int64_t)revision;
- (unint64_t)hash;
@end

@implementation HDClinicalProviderServiceModel

+ (void)initialize
{
  HDHealthRecordsPluginBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v3 resourceURL];
  +[HKJSONValidator registerSearchPath:v2];
}

- (HDClinicalProviderServiceModel)init
{
  id v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalProviderServiceModel)initWithContent:(id)a3
{
  id v5 = a3;
  if (([(id)objc_opt_class() validateContent:v5 error:0] & 1) == 0)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDClinicalProviderServiceModel.m", 33, @"Invalid parameter not satisfying: %@", @"[self.class validateContent:content error:nil]" object file lineNumber description];
  }
  v6 = [(HDClinicalProviderServiceModel *)self _initWithoutValidatingContent:v5];

  return v6;
}

- (id)_initWithoutValidatingContent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDClinicalProviderServiceModel;
  id v5 = [(HDClinicalProviderServiceModel *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copyWithZone:0];
    content = v5->_content;
    v5->_content = v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDClinicalProviderServiceModel *)a3;
  if (self == v4)
  {
    unsigned __int8 v11 = 1;
  }
  else if ([(HDClinicalProviderServiceModel *)v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [(HDClinicalProviderServiceModel *)self content];
    v7 = [(HDClinicalProviderServiceModel *)v5 content];
    if (v6 == v7)
    {
      unsigned __int8 v11 = 1;
    }
    else
    {
      v8 = [(HDClinicalProviderServiceModel *)v5 content];
      if (v8)
      {
        objc_super v9 = [(HDClinicalProviderServiceModel *)self content];
        v10 = [(HDClinicalProviderServiceModel *)v5 content];
        unsigned __int8 v11 = [v9 isEqual:v10];
      }
      else
      {
        unsigned __int8 v11 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)createRawContentWithError:(id *)a3
{
  id v4 = [(HDClinicalProviderServiceModel *)self content];
  id v5 = +[NSJSONSerialization dataWithJSONObject:v4 options:0 error:a3];

  return v5;
}

+ (BOOL)validateContent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_137188);
  if (!qword_137190)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)qword_137190;
    qword_137190 = (uint64_t)v7;
  }
  objc_super v9 = [a1 schemaName];
  uint64_t v10 = [(id)qword_137190 objectForKeyedSubscript:v9];
  if (v10)
  {
    id v11 = (id)v10;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_137188);
  }
  else
  {
    id v12 = objc_alloc((Class)HKJSONValidator);
    v13 = HDHealthRecordsPluginBundle();
    id v11 = [v12 initWithSchemaNamed:v9 bundle:v13];

    [(id)qword_137190 setObject:v11 forKeyedSubscript:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_137188);
    if (!v11)
    {
      +[NSError hk_assignError:a4, 100, @"Failed to create validator for %@ with schema named %@", a1, v9 code format];
      unsigned __int8 v14 = 0;
      goto LABEL_7;
    }
  }
  unsigned __int8 v14 = [v11 validateJSONObject:v6 error:a4];

LABEL_7:
  return v14;
}

- (int64_t)revision
{
  v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"updated"];
  id v4 = [v3 longLongValue];

  return (int64_t)v4;
}

- (NSDictionary)content
{
  return self->_content;
}

- (void).cxx_destruct
{
}

+ (NSString)schemaName
{
  return 0;
}

@end