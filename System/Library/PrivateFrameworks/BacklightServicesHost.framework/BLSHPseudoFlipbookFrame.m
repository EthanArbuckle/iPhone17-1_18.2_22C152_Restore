@interface BLSHPseudoFlipbookFrame
- (BLSHPresentationDateSpecifier)bls_specifier;
- (BLSHPseudoFlipbookFrame)initWithPresentationTime:(unint64_t)a3 frameId:(unint64_t)a4 specifier:(id)a5 memoryUsage:(unint64_t)a6;
- (BOOL)isInverted;
- (CGRect)rawSurfaceFrame;
- (NSUUID)bls_uuid;
- (__IOSurface)rawSurface;
- (__IOSurface)surface;
- (float)apl;
- (float)aplDimming;
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
- (unint64_t)frameId;
- (unint64_t)memoryUsage;
- (unint64_t)presentationTime;
@end

@implementation BLSHPseudoFlipbookFrame

- (BLSHPseudoFlipbookFrame)initWithPresentationTime:(unint64_t)a3 frameId:(unint64_t)a4 specifier:(id)a5 memoryUsage:(unint64_t)a6
{
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSHPseudoFlipbookFrame;
  v11 = [(BLSHPseudoFlipbookFrame *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_presentationTime = a3;
    v11->_frameId = a4;
    objc_storeStrong((id *)&v11->_bls_specifier, a5);
  }

  return v12;
}

- (float)apl
{
  return NAN;
}

- (float)aplDimming
{
  return NAN;
}

- (__IOSurface)surface
{
  return 0;
}

- (__IOSurface)rawSurface
{
  return 0;
}

- (CGRect)rawSurfaceFrame
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isInverted
{
  return 0;
}

- (NSUUID)bls_uuid
{
  return 0;
}

- (id)bls_loggingString
{
  double v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [(BLSHPseudoFlipbookFrame *)self presentationTime];
  double v4 = BLSLoggingStringForMachTime();
  [v3 appendString:v4 withName:@"presentationTime"];

  id v5 = (id)objc_msgSend(v3, "appendUInt64:withName:", -[BLSHPseudoFlipbookFrame frameId](self, "frameId"), @"frameId");
  v6 = [(BLSHPseudoFlipbookFrame *)self bls_specifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"specifier"];

  v8 = [v3 build];

  return v8;
}

- (id)bls_shortLoggingString
{
  double v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", -[BLSHPseudoFlipbookFrame frameId](self, "frameId"), @"frameId");
  id v5 = [(BLSHPseudoFlipbookFrame *)self bls_specifier];
  if (v5)
  {
    v6 = [(BLSHPseudoFlipbookFrame *)self bls_specifier];
    id v7 = objc_msgSend(v6, "bls_shortLoggingString");
    [v3 appendString:v7 withName:&stru_26D1758B0];
  }
  else
  {
    [(BLSHPseudoFlipbookFrame *)self presentationTime];
    v6 = BLSShortLoggingStringForMachTime();
    [v3 appendString:v6 withName:&stru_26D1758B0];
  }

  v8 = [v3 build];

  return v8;
}

- (unint64_t)presentationTime
{
  return self->_presentationTime;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (BLSHPresentationDateSpecifier)bls_specifier
{
  return self->_bls_specifier;
}

- (unint64_t)memoryUsage
{
  return self->_memoryUsage;
}

- (void).cxx_destruct
{
}

@end