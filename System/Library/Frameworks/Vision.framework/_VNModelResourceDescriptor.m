@interface _VNModelResourceDescriptor
- (_VNModelResourceDescriptor)initWithModelURL:(id)a3;
- (id)modelURL;
@end

@implementation _VNModelResourceDescriptor

- (void).cxx_destruct
{
}

- (id)modelURL
{
  return self->_modelURL;
}

- (_VNModelResourceDescriptor)initWithModelURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VNModelResourceDescriptor;
  v6 = [(VNResourceDescriptor *)&v9 _init];
  v7 = (_VNModelResourceDescriptor *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

@end