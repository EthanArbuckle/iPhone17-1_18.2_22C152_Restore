@interface NSString(WFDataEncoding)
+ (id)wf_stringWithData:()WFDataEncoding;
@end

@implementation NSString(WFDataEncoding)

+ (id)wf_stringWithData:()WFDataEncoding
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    v5 = v4;
    if (!v4)
    {
      v8 = 0;
      [NSString stringEncodingForData:v3 encodingOptions:0 convertedString:&v8 usedLossyConversion:0];
      v5 = v8;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end