@interface AVRoutingConfiguration
+ (AVRoutingConfiguration)configurationWithOutputContextID:(id)a3 sharingPolicy:(unint64_t)a4;
+ (id)defaultConfiguration;
- (BOOL)isDefault;
- (NSString)outputContextID;
- (unint64_t)sharingPolicy;
@end

@implementation AVRoutingConfiguration

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(AVRoutingConfiguration);
  v2->_isDefault = 1;

  return v2;
}

- (void).cxx_destruct
{
}

- (unint64_t)sharingPolicy
{
  return self->_sharingPolicy;
}

- (NSString)outputContextID
{
  return self->_outputContextID;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

+ (AVRoutingConfiguration)configurationWithOutputContextID:(id)a3 sharingPolicy:(unint64_t)a4
{
  v5 = (NSString *)a3;
  v6 = objc_alloc_init(AVRoutingConfiguration);
  outputContextID = v6->_outputContextID;
  v6->_outputContextID = v5;

  v6->_sharingPolicy = a4;

  return v6;
}

@end