@interface FTNetworkDescriptor
- (FTNetworkDescriptor)init;
- (NSArray)inputImages;
- (NSArray)inputReferences;
- (NSArray)outputNames;
- (NSString)name;
- (id)onlyImageInput;
- (void)setInputImages:(id)a3;
- (void)setInputReferences:(id)a3;
- (void)setName:(id)a3;
- (void)setOutputNames:(id)a3;
@end

@implementation FTNetworkDescriptor

- (FTNetworkDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTNetworkDescriptor;
  v2 = [(FTNetworkDescriptor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(FTNetworkDescriptor *)v2 setOutputNames:MEMORY[0x263EFFA68]];
    v4 = v3;
  }

  return v3;
}

- (id)onlyImageInput
{
  v3 = [(FTNetworkDescriptor *)self inputImages];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    NSLog(&cfstr_ExpectedExactl.isa, v4);
  }
  v5 = [(FTNetworkDescriptor *)self inputImages];
  objc_super v6 = [v5 firstObject];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)inputImages
{
  return self->_inputImages;
}

- (void)setInputImages:(id)a3
{
}

- (NSArray)inputReferences
{
  return self->_inputReferences;
}

- (void)setInputReferences:(id)a3
{
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (void)setOutputNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputReferences, 0);
  objc_storeStrong((id *)&self->_inputImages, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end