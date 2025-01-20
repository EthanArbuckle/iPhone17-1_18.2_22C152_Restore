@interface LACDTOFeatureEnablementModeCoder
- (id)decode:(id)a3;
- (id)encode:(id)a3;
@end

@implementation LACDTOFeatureEnablementModeCoder

- (id)encode:(id)a3
{
  char v7 = [a3 rawValue];
  v3 = [LACDTOKVStoreValue alloc];
  v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&v7 length:1];
  v5 = [(LACDTOKVStoreValue *)v3 initWithData:v4];

  return v5;
}

- (id)decode:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  if (v3 == 1)
  {
    v4 = +[LACDTOFeatureEnablementMode enabled];
  }
  else
  {
    if (v3 == 2) {
      +[LACDTOFeatureEnablementMode enabledWithGracePeriod];
    }
    else {
    v4 = +[LACDTOFeatureEnablementMode disabled];
    }
  }
  return v4;
}

@end