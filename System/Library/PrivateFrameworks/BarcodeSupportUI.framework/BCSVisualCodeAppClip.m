@interface BCSVisualCodeAppClip
+ (BOOL)supportsSecureCoding;
- (BCSVisualCodeAppClip)initWithCoder:(id)a3;
- (BCSVisualCodeAppClip)initWithPayloadString:(id)a3 version:(unint64_t)a4;
- (BCSVisualCodeAppClip)initWithRawPayload:(id)a3 version:(unint64_t)a4;
- (CGRect)boundingBox;
- (id)payloadString;
- (id)rawPayload;
- (int64_t)codeType;
- (unint64_t)codeVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSVisualCodeAppClip

- (BCSVisualCodeAppClip)initWithPayloadString:(id)a3 version:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSVisualCodeAppClip;
  v7 = [(BCSVisualCodeAppClip *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    payloadString = v7->_payloadString;
    v7->_payloadString = (NSString *)v8;

    v7->_codeVersion = a4;
    v10 = v7;
  }

  return v7;
}

- (BCSVisualCodeAppClip)initWithRawPayload:(id)a3 version:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSVisualCodeAppClip;
  v7 = [(BCSVisualCodeAppClip *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    rawDataPayload = v7->_rawDataPayload;
    v7->_rawDataPayload = (NSData *)v8;

    v7->_codeVersion = a4;
    v10 = v7;
  }

  return v7;
}

- (id)payloadString
{
  return self->_payloadString;
}

- (unint64_t)codeVersion
{
  return self->_codeVersion;
}

- (int64_t)codeType
{
  return 1;
}

- (id)rawPayload
{
  return self->_rawDataPayload;
}

- (CGRect)boundingBox
{
  v24[5] = *MEMORY[0x263EF8340];
  [(BCSVisualCode *)self topLeft];
  double v4 = v3;
  double v6 = v5;
  [(BCSVisualCode *)self topRight];
  uint64_t v23 = v7;
  v24[0] = v8;
  [(BCSVisualCode *)self bottomLeft];
  v24[1] = v9;
  v24[2] = v10;
  [(BCSVisualCode *)self bottomRight];
  uint64_t v11 = 0;
  v24[3] = v12;
  v24[4] = v13;
  double v14 = v4;
  double v15 = v6;
  do
  {
    double v16 = *(double *)&v22[v11 * 8 + 16];
    double v17 = *(double *)&v24[v11];
    if (v4 >= v16) {
      double v4 = *(double *)&v22[v11 * 8 + 16];
    }
    if (v14 < v16) {
      double v14 = *(double *)&v22[v11 * 8 + 16];
    }
    if (v6 >= v17) {
      double v6 = *(double *)&v24[v11];
    }
    if (v15 < v17) {
      double v15 = *(double *)&v24[v11];
    }
    v11 += 2;
  }
  while (v11 != 6);
  double v18 = v14 - v4;
  double v19 = v15 - v6;
  double v20 = v4;
  double v21 = v6;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  payloadString = self->_payloadString;
  id v5 = a3;
  [v5 encodeObject:payloadString forKey:@"payloadString"];
  double v6 = [NSNumber numberWithUnsignedInteger:self->_codeVersion];
  [v5 encodeObject:v6 forKey:@"codeVersion"];

  [v5 encodeObject:self->_rawDataPayload forKey:@"rawDataPayload"];
  uint64_t v7 = (void *)MEMORY[0x263F08D40];
  [(BCSVisualCode *)self topLeft];
  v26[0] = v8;
  v26[1] = v9;
  uint64_t v10 = [v7 valueWithBytes:v26 objCType:"{CGPoint=dd}"];
  [v5 encodeObject:v10 forKey:@"topLeft"];

  uint64_t v11 = (void *)MEMORY[0x263F08D40];
  [(BCSVisualCode *)self topRight];
  v25[0] = v12;
  v25[1] = v13;
  double v14 = [v11 valueWithBytes:v25 objCType:"{CGPoint=dd}"];
  [v5 encodeObject:v14 forKey:@"topRight"];

  double v15 = (void *)MEMORY[0x263F08D40];
  [(BCSVisualCode *)self bottomRight];
  v24[0] = v16;
  v24[1] = v17;
  double v18 = [v15 valueWithBytes:v24 objCType:"{CGPoint=dd}"];
  [v5 encodeObject:v18 forKey:@"bottomRight"];

  double v19 = (void *)MEMORY[0x263F08D40];
  [(BCSVisualCode *)self bottomLeft];
  v23[0] = v20;
  v23[1] = v21;
  v22 = [v19 valueWithBytes:v23 objCType:"{CGPoint=dd}"];
  [v5 encodeObject:v22 forKey:@"bottomLeft"];
}

- (BCSVisualCodeAppClip)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"codeVersion");
  double v6 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"payloadString");
  if (v6) {
    uint64_t v7 = -[BCSVisualCodeAppClip initWithPayloadString:version:]([BCSVisualCodeAppClip alloc], "initWithPayloadString:version:", v6, [v5 unsignedIntegerValue]);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"rawDataPayload");
  if (v8)
  {
    uint64_t v9 = -[BCSVisualCodeAppClip initWithRawPayload:version:]([BCSVisualCodeAppClip alloc], "initWithRawPayload:version:", v8, [v5 unsignedIntegerValue]);

    uint64_t v7 = v9;
  }
  uint64_t v10 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"topLeft");
  [v10 CGPointValue];
  -[BCSVisualCode setTopLeft:](v7, "setTopLeft:");

  uint64_t v11 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"topRight");
  [v11 CGPointValue];
  -[BCSVisualCode setTopRight:](v7, "setTopRight:");

  uint64_t v12 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"bottomRight");
  [v12 CGPointValue];
  -[BCSVisualCode setBottomRight:](v7, "setBottomRight:");

  uint64_t v13 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"bottomLeft");
  [v13 CGPointValue];
  -[BCSVisualCode setBottomLeft:](v7, "setBottomLeft:");

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawDataPayload, 0);

  objc_storeStrong((id *)&self->_payloadString, 0);
}

@end