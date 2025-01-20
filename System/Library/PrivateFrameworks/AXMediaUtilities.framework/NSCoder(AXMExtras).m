@interface NSCoder(AXMExtras)
- (double)axmDecodePointForKey:()AXMExtras;
- (double)axmDecodeRectForKey:()AXMExtras;
- (double)axmDecodeSizeForKey:()AXMExtras;
- (void)axmEncodePoint:()AXMExtras forKey:;
- (void)axmEncodeRect:()AXMExtras forKey:;
- (void)axmEncodeSize:()AXMExtras forKey:;
@end

@implementation NSCoder(AXMExtras)

- (void)axmEncodeSize:()AXMExtras forKey:
{
  double v9 = a2;
  double v10 = a3;
  v6 = (void *)MEMORY[0x1E4F29238];
  id v7 = a5;
  v8 = [v6 value:&v9 withObjCType:"{CGSize=dd}"];
  objc_msgSend(a1, "encodeObject:forKey:", v8, v7, *(void *)&v9, *(void *)&v10);
}

- (double)axmDecodeSizeForKey:()AXMExtras
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  long long v7 = *MEMORY[0x1E4F1DB30];
  [v5 getValue:&v7 size:16];

  return *(double *)&v7;
}

- (void)axmEncodePoint:()AXMExtras forKey:
{
  double v9 = a2;
  double v10 = a3;
  v6 = (void *)MEMORY[0x1E4F29238];
  id v7 = a5;
  v8 = [v6 value:&v9 withObjCType:"{CGPoint=dd}"];
  objc_msgSend(a1, "encodeObject:forKey:", v8, v7, *(void *)&v9, *(void *)&v10);
}

- (double)axmDecodePointForKey:()AXMExtras
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  long long v7 = *MEMORY[0x1E4F1DAD8];
  [v5 getValue:&v7 size:16];

  return *(double *)&v7;
}

- (void)axmEncodeRect:()AXMExtras forKey:
{
  double v11 = a2;
  double v12 = a3;
  double v13 = a4;
  double v14 = a5;
  v8 = (void *)MEMORY[0x1E4F29238];
  id v9 = a7;
  double v10 = [v8 value:&v11 withObjCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  objc_msgSend(a1, "encodeObject:forKey:", v10, v9, *(void *)&v11, *(void *)&v12, *(void *)&v13, *(void *)&v14);
}

- (double)axmDecodeRectForKey:()AXMExtras
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v8[0] = *MEMORY[0x1E4F1DB28];
  v8[1] = v6;
  [v5 getValue:v8 size:32];

  return *(double *)v8;
}

@end