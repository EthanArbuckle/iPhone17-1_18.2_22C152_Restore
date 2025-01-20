@interface VNFrameworkResourceDescriptor
+ (id)descriptorForFrameworkContainingClass:(Class)a3 error:(id *)a4;
+ (id)descriptorForFrameworkContainingClassNamed:(id)a3 error:(id *)a4;
+ (id)descriptorForFrameworkIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSBundle)frameworkBundle;
- (VNFrameworkResourceDescriptor)initWithBundle:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation VNFrameworkResourceDescriptor

- (void).cxx_destruct
{
}

- (NSBundle)frameworkBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNFrameworkResourceDescriptor *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(VNFrameworkResourceDescriptor *)self frameworkBundle];
      v7 = [(VNFrameworkResourceDescriptor *)v5 frameworkBundle];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(VNFrameworkResourceDescriptor *)self frameworkBundle];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)VNFrameworkResourceDescriptor;
  unint64_t v3 = [(VNFrameworkResourceDescriptor *)&v8 description];
  v4 = [(VNFrameworkResourceDescriptor *)self frameworkBundle];
  v5 = [v4 bundlePath];
  v6 = [v3 stringByAppendingFormat:@" %@", v5];

  return v6;
}

- (VNFrameworkResourceDescriptor)initWithBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNFrameworkResourceDescriptor;
  v6 = [(VNResourceDescriptor *)&v9 _init];
  v7 = (VNFrameworkResourceDescriptor *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

+ (id)descriptorForFrameworkContainingClassNamed:(id)a3 error:(id *)a4
{
  v6 = (NSString *)a3;
  Class v7 = NSClassFromString(v6);
  if (v7)
  {
    a4 = [a1 descriptorForFrameworkContainingClass:v7 error:a4];
  }
  else if (a4)
  {
    objc_super v8 = (void *)[[NSString alloc] initWithFormat:@"The class %@ could not be resolved at runtime", v6];
    *a4 = +[VNError errorForDataUnavailableWithLocalizedDescription:v8];

    a4 = 0;
  }

  return a4;
}

+ (id)descriptorForFrameworkContainingClass:(Class)a3 error:(id *)a4
{
  Class v7 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:");
  if (v7)
  {
    a4 = (id *)[objc_alloc((Class)a1) initWithBundle:v7];
  }
  else if (a4)
  {
    id v8 = [NSString alloc];
    objc_super v9 = NSStringFromClass(a3);
    v10 = (void *)[v8 initWithFormat:@"Could not locate framework containing %@", v9];

    *a4 = +[VNError errorForDataUnavailableWithLocalizedDescription:v10];

    a4 = 0;
  }

  return a4;
}

+ (id)descriptorForFrameworkIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  Class v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:v6];
  if (v7)
  {
    a4 = (id *)[objc_alloc((Class)a1) initWithBundle:v7];
  }
  else if (a4)
  {
    id v8 = (void *)[[NSString alloc] initWithFormat:@"Could not locate framework with identifier \"%@\"", v6];
    *a4 = +[VNError errorForDataUnavailableWithLocalizedDescription:v8];

    a4 = 0;
  }

  return a4;
}

@end