@interface ADEspressoImageDescriptor
+ (id)descriptorWithName:(id)a3 imageDescriptor:(id)a4 isInput:(BOOL)a5;
+ (id)inputDescriptorWithName:(id)a3 pixelFormat:(unsigned int)a4;
+ (id)outputDescriptorWithName:(id)a3 pixelFormat:(unsigned int)a4;
- (ADImageDescriptor)imageDescriptor;
- (BOOL)isInput;
- (NSString)name;
@end

@implementation ADEspressoImageDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDescriptor, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)descriptorWithName:(id)a3 imageDescriptor:(id)a4 isInput:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  uint64_t v11 = 0;
  if (v8)
  {
    if (v9)
    {
      uint64_t v12 = objc_opt_new();
      uint64_t v11 = v12;
      if (v12)
      {
        objc_storeStrong((id *)(v12 + 16), a3);
        *(unsigned char *)(v11 + 8) = a5;
        objc_storeStrong((id *)(v11 + 24), a4);
      }
    }
  }

  return (id)v11;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isInput
{
  return self->_isInput;
}

- (ADImageDescriptor)imageDescriptor
{
  return self->_imageDescriptor;
}

+ (id)outputDescriptorWithName:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = +[ADImageDescriptor descriptorForSupportedSizes:0 pixelFormat:v4];
  v7 = +[ADEspressoImageDescriptor descriptorWithName:v5 imageDescriptor:v6 isInput:0];

  return v7;
}

+ (id)inputDescriptorWithName:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = +[ADImageDescriptor descriptorForSupportedSizes:0 pixelFormat:v4];
  v7 = +[ADEspressoImageDescriptor descriptorWithName:v5 imageDescriptor:v6 isInput:1];

  return v7;
}

@end