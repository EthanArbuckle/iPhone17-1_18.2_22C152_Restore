@interface VNCIMultiplicationFilter
- (NSNumber)inputFactor1;
- (NSNumber)inputFactor2;
- (NSNumber)inputFactor3;
- (NSNumber)inputFactor4;
- (VNCIMultiplicationFilter)init;
- (id)outputImage;
- (void)setInputFactor1:(id)a3;
- (void)setInputFactor2:(id)a3;
- (void)setInputFactor3:(id)a3;
- (void)setInputFactor4:(id)a3;
@end

@implementation VNCIMultiplicationFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFactor4, 0);
  objc_storeStrong((id *)&self->_inputFactor3, 0);
  objc_storeStrong((id *)&self->_inputFactor2, 0);

  objc_storeStrong((id *)&self->_inputFactor1, 0);
}

- (void)setInputFactor4:(id)a3
{
}

- (NSNumber)inputFactor4
{
  return self->_inputFactor4;
}

- (void)setInputFactor3:(id)a3
{
}

- (NSNumber)inputFactor3
{
  return self->_inputFactor3;
}

- (void)setInputFactor2:(id)a3
{
}

- (NSNumber)inputFactor2
{
  return self->_inputFactor2;
}

- (void)setInputFactor1:(id)a3
{
}

- (NSNumber)inputFactor1
{
  return self->_inputFactor1;
}

- (id)outputImage
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v3 = [(VNCIMultiplicationFilter *)self inputFactor1];
  v10[0] = v3;
  v4 = [(VNCIMultiplicationFilter *)self inputFactor2];
  v10[1] = v4;
  v5 = [(VNCIMultiplicationFilter *)self inputFactor3];
  v10[2] = v5;
  v6 = [(VNCIMultiplicationFilter *)self inputFactor4];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  v8 = -[VNCIFilter applyWithArguments:]((id *)&self->super.super.super.isa, v7);

  return v8;
}

- (VNCIMultiplicationFilter)init
{
  v3 = [NSString stringWithUTF8String:"multiplyByFactor"];
  v10.receiver = self;
  v10.super_class = (Class)VNCIMultiplicationFilter;
  v4 = [(VNCIFilter *)&v10 initWithKernelName:v3];

  if (v4)
  {
    inputFactor1 = v4->_inputFactor1;
    v4->_inputFactor1 = (NSNumber *)&unk_1EF7A81D0;

    inputFactor2 = v4->_inputFactor2;
    v4->_inputFactor2 = (NSNumber *)&unk_1EF7A81D0;

    inputFactor3 = v4->_inputFactor3;
    v4->_inputFactor3 = (NSNumber *)&unk_1EF7A81D0;

    inputFactor4 = v4->_inputFactor4;
    v4->_inputFactor4 = (NSNumber *)&unk_1EF7A81D0;
  }
  return v4;
}

@end