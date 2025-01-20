@interface VNBarcodeObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)_propertyAllowedForRevision;
- (BOOL)isColorInverted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGS1DataCarrier;
- (CIBarcodeDescriptor)barcodeDescriptor;
- (NSData)payloadData;
- (NSData)supplementalPayloadData;
- (NSDictionary)acbsBarcodeInfo;
- (NSNumber)appClipCodeMetadataValue;
- (NSString)payloadStringValue;
- (NSString)supplementalPayloadString;
- (VNBarcodeCompositeType)supplementalCompositeType;
- (VNBarcodeObservation)initWithCoder:(id)a3;
- (VNBarcodeObservation)initWithOriginatingRequestSpecifier:(id)a3 symbology:(id)a4 descriptor:(id)a5 boundingBox:(CGRect)a6;
- (VNBarcodeObservation)initWithOriginatingRequestSpecifier:(id)a3 symbology:(id)a4 descriptor:(id)a5 mrcDescriptor:(__MRCDescriptor *)a6 topLeft:(CGPoint)a7 topRight:(CGPoint)a8 bottomRight:(CGPoint)a9 bottomLeft:(CGPoint)a10;
- (VNBarcodeObservation)initWithOriginatingRequestSpecifier:(id)a3 symbology:(id)a4 descriptor:(id)a5 topLeft:(CGPoint)a6 topRight:(CGPoint)a7 bottomRight:(CGPoint)a8 bottomLeft:(CGPoint)a9;
- (VNBarcodeSymbology)symbology;
- (__MRCDescriptor)mrcDescriptor;
- (id)description;
- (id)getDataDetectorResults:(id *)a3;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)_cacheMRCDescriptorValues;
- (void)_cachePayloadAndSupplementalPayload;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setACBSBarcodeInfo:(id)a3;
- (void)setMRCDescriptor:(__MRCDescriptor *)a3;
- (void)setMrcDescriptor:(__MRCDescriptor *)a3;
@end

@implementation VNBarcodeObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acbsBarcodeInfo, 0);
  objc_storeStrong((id *)&self->_barcodeDescriptor, 0);
  objc_storeStrong((id *)&self->_symbology, 0);
  objc_storeStrong((id *)&self->_cachedSupplementalPayloadRawData, 0);
  objc_storeStrong((id *)&self->_cachedSupplementalCompositeType, 0);
  objc_storeStrong((id *)&self->_cachedSupplementalPayload, 0);
  objc_storeStrong((id *)&self->_cachedIsGS1DataCarrier, 0);
  objc_storeStrong((id *)&self->_cachedIsColorInverted, 0);
  objc_storeStrong((id *)&self->_cachedAppClipCodeMetadataValue, 0);
  objc_storeStrong((id *)&self->_cachedPayloadData, 0);

  objc_storeStrong((id *)&self->_cachedPayloadStringValue, 0);
}

- (void)setMRCDescriptor:(__MRCDescriptor *)a3
{
  self->_mrcDescriptor = a3;
}

- (__MRCDescriptor)mrcDescriptor
{
  return self->_mrcDescriptor;
}

- (void)setACBSBarcodeInfo:(id)a3
{
}

- (NSDictionary)acbsBarcodeInfo
{
  return self->_acbsBarcodeInfo;
}

- (CIBarcodeDescriptor)barcodeDescriptor
{
  return self->_barcodeDescriptor;
}

- (VNBarcodeSymbology)symbology
{
  return self->_symbology;
}

- (id)getDataDetectorResults:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v5 = [(VNBarcodeObservation *)self payloadStringValue];
  v6 = [(VNObservation *)self getDataDetectorResultsForString:v5 error:a3];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v7 = (void *)getBCSDetectedCodeClass_softClass;
  uint64_t v26 = getBCSDetectedCodeClass_softClass;
  if (!getBCSDetectedCodeClass_softClass)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __getBCSDetectedCodeClass_block_invoke;
    v22[3] = &unk_1E5B20220;
    v22[4] = &v23;
    __getBCSDetectedCodeClass_block_invoke((uint64_t)v22);
    v7 = (void *)v24[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v23, 8);
  v9 = [v8 detectedCodeWithBarcodeObservation:self];
  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "setDetectedBarcodeSupportCode:", v9, (void)v18);
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v11);
    }
    v14 = v10;
  }
  else
  {
    v15 = [VNDataDetectorResult alloc];
    id v10 = [(VNBarcodeObservation *)self payloadStringValue];
    v16 = [(VNDataDetectorResult *)v15 initWithBCSDetectedCode:v9 description:v10 observation:self];
    v27 = v16;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  }
  kdebug_trace();

  return v14;
}

- (BOOL)isColorInverted
{
  if (![(VNBarcodeObservation *)self _propertyAllowedForRevision]) {
    return 0;
  }
  cachedIsColorInverted = self->_cachedIsColorInverted;
  if (!cachedIsColorInverted) {
    return 0;
  }

  return [(NSNumber *)cachedIsColorInverted BOOLValue];
}

- (NSNumber)appClipCodeMetadataValue
{
  return self->_cachedAppClipCodeMetadataValue;
}

- (NSData)payloadData
{
  return self->_cachedPayloadData;
}

- (VNBarcodeCompositeType)supplementalCompositeType
{
  if (![(VNBarcodeObservation *)self _propertyAllowedForRevision]) {
    return 0;
  }
  cachedSupplementalCompositeType = self->_cachedSupplementalCompositeType;
  if (!cachedSupplementalCompositeType) {
    return 0;
  }

  return [(NSNumber *)cachedSupplementalCompositeType integerValue];
}

- (NSData)supplementalPayloadData
{
  if ([(VNBarcodeObservation *)self _propertyAllowedForRevision]) {
    v3 = self->_cachedSupplementalPayloadRawData;
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (NSString)supplementalPayloadString
{
  if ([(VNBarcodeObservation *)self _propertyAllowedForRevision]) {
    v3 = self->_cachedSupplementalPayload;
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isGS1DataCarrier
{
  if (![(VNBarcodeObservation *)self _propertyAllowedForRevision]) {
    return 0;
  }
  cachedIsGS1DataCarrier = self->_cachedIsGS1DataCarrier;
  if (!cachedIsGS1DataCarrier) {
    return 0;
  }

  return [(NSNumber *)cachedIsGS1DataCarrier BOOLValue];
}

- (BOOL)_propertyAllowedForRevision
{
  v2 = [(VNObservation *)self originatingRequestSpecifier];
  char v3 = [v2 specifiesRequestClass:objc_opt_class() revision:4];

  return v3;
}

- (NSString)payloadStringValue
{
  if (!self->_cachedPayloadStringValue)
  {
    if (self->_acbsBarcodeInfo)
    {
      char v3 = (void *)ACBSCreateSymbolDescriptorFromBasicDescriptor();
      v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F944A0]];
      v5 = (NSString *)[v4 copy];
      cachedPayloadStringValue = self->_cachedPayloadStringValue;
      self->_cachedPayloadStringValue = v5;
    }
    else if (self->_mrcDescriptor)
    {
      [(VNBarcodeObservation *)self _cachePayloadAndSupplementalPayload];
    }
  }
  v7 = self->_cachedPayloadStringValue;

  return v7;
}

- (void)_cachePayloadAndSupplementalPayload
{
  char v3 = (void *)MRCDescriptorDecodePayloadAndSupplementalPayload();
  v4 = v3;
  if (v3)
  {
    v5 = (NSString *)[v3 copy];
    cachedPayloadStringValue = self->_cachedPayloadStringValue;
    self->_cachedPayloadStringValue = v5;

    cachedSupplementalPayload = self->_cachedSupplementalPayload;
    self->_cachedSupplementalPayload = 0;
  }
  else
  {
    CFStringRef v8 = CFErrorCopyDescription(0);
    VNValidatedLog(4, @"Could not decode payload from MRCDescriptor %@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    CFRelease(v8);
  }
}

- (id)description
{
  v20.receiver = self;
  v20.super_class = (Class)VNBarcodeObservation;
  char v3 = [(VNDetectedObjectObservation *)&v20 description];
  v4 = [v3 stringByAppendingFormat:@" %@", self->_symbology];

  uint64_t v5 = [(VNBarcodeObservation *)self barcodeDescriptor];
  v6 = (void *)v5;
  if (v5)
  {
    uint64_t v7 = [v4 stringByAppendingFormat:@" %@", v5];

    v4 = (void *)v7;
  }
  uint64_t v8 = [(VNBarcodeObservation *)self payloadStringValue];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = [v4 stringByAppendingFormat:@" (%@)", v8];

    v4 = (void *)v10;
  }
  uint64_t v11 = [(VNBarcodeObservation *)self payloadData];
  uint64_t v12 = (void *)v11;
  if (v11)
  {
    uint64_t v13 = [v4 stringByAppendingFormat:@" (%@)", v11];

    v4 = (void *)v13;
  }
  uint64_t v14 = [(VNBarcodeObservation *)self supplementalPayloadString];
  v15 = (void *)v14;
  if (v14)
  {
    uint64_t v16 = [v4 stringByAppendingFormat:@" (%@)", v14];

    v4 = (void *)v16;
  }
  v17 = [(VNBarcodeObservation *)self supplementalPayloadData];
  if (v12)
  {
    uint64_t v18 = [v4 stringByAppendingFormat:@" (%@)", v12];

    v4 = (void *)v18;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNBarcodeObservation *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VNBarcodeObservation;
    if ([(VNRectangleObservation *)&v18 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v5 = v4;
      v6 = [(VNBarcodeObservation *)self symbology];
      uint64_t v7 = [(VNBarcodeObservation *)v5 symbology];
      int v8 = VisionCoreEqualOrNilObjects();

      if (!v8) {
        goto LABEL_12;
      }
      uint64_t v9 = [(VNBarcodeObservation *)self barcodeDescriptor];
      uint64_t v10 = [(VNBarcodeObservation *)v5 barcodeDescriptor];
      int v11 = VisionCoreEqualOrNilObjects();

      if (!v11) {
        goto LABEL_12;
      }
      uint64_t v12 = [(VNBarcodeObservation *)self acbsBarcodeInfo];
      uint64_t v13 = [(VNBarcodeObservation *)v5 acbsBarcodeInfo];
      int v14 = VisionCoreEqualOrNilObjects();

      if (!v14) {
        goto LABEL_12;
      }
      v15 = [(VNBarcodeObservation *)self mrcDescriptor];
      if (v15 == [(VNBarcodeObservation *)v5 mrcDescriptor]
        || CFEqual([(VNBarcodeObservation *)self mrcDescriptor], [(VNBarcodeObservation *)v5 mrcDescriptor]))
      {
        BOOL v16 = 1;
      }
      else
      {
LABEL_12:
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)VNBarcodeObservation;
  id v3 = [(VNRectangleObservation *)&v12 hash];
  v4 = [(VNBarcodeObservation *)self symbology];
  uint64_t v5 = [v4 hash] ^ __ROR8__(v3, 51);

  v6 = [(VNBarcodeObservation *)self barcodeDescriptor];
  uint64_t v7 = [v6 hash] ^ __ROR8__(v5, 51);

  int v8 = [(VNBarcodeObservation *)self acbsBarcodeInfo];
  unint64_t v9 = [v8 hash] ^ __ROR8__(v7, 51);

  mrcDescriptor = self->_mrcDescriptor;
  if (mrcDescriptor) {
    return CFHash(mrcDescriptor) ^ __ROR8__(v9, 51);
  }
  return v9;
}

- (id)vn_cloneObject
{
  v23.receiver = self;
  v23.super_class = (Class)VNBarcodeObservation;
  uint64_t v3 = [(VNRectangleObservation *)&v23 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSString *)self->_symbology copy];
    uint64_t v5 = *(void **)(v3 + 288);
    *(void *)(v3 + 288) = v4;

    objc_storeStrong((id *)(v3 + 296), self->_barcodeDescriptor);
    [(id)v3 setACBSBarcodeInfo:self->_acbsBarcodeInfo];
    [(id)v3 setMrcDescriptor:self->_mrcDescriptor];
    uint64_t v6 = [(NSString *)self->_cachedPayloadStringValue copy];
    uint64_t v7 = *(void **)(v3 + 224);
    *(void *)(v3 + 224) = v6;

    uint64_t v8 = [(NSData *)self->_cachedPayloadData copy];
    unint64_t v9 = *(void **)(v3 + 232);
    *(void *)(v3 + 232) = v8;

    uint64_t v10 = [(NSNumber *)self->_cachedAppClipCodeMetadataValue copy];
    int v11 = *(void **)(v3 + 240);
    *(void *)(v3 + 240) = v10;

    uint64_t v12 = [(NSNumber *)self->_cachedIsColorInverted copy];
    uint64_t v13 = *(void **)(v3 + 248);
    *(void *)(v3 + 248) = v12;

    uint64_t v14 = [(NSNumber *)self->_cachedIsGS1DataCarrier copy];
    v15 = *(void **)(v3 + 256);
    *(void *)(v3 + 256) = v14;

    uint64_t v16 = [(NSString *)self->_cachedSupplementalPayload copy];
    v17 = *(void **)(v3 + 264);
    *(void *)(v3 + 264) = v16;

    uint64_t v18 = [(NSData *)self->_cachedSupplementalPayloadRawData copy];
    long long v19 = *(void **)(v3 + 280);
    *(void *)(v3 + 280) = v18;

    uint64_t v20 = [(NSNumber *)self->_cachedSupplementalCompositeType copy];
    long long v21 = *(void **)(v3 + 272);
    *(void *)(v3 + 272) = v20;
  }

  return (id)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNBarcodeObservation;
  [(VNRectangleObservation *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_symbology forKey:@"symbology"];
  [v4 encodeObject:self->_barcodeDescriptor forKey:@"barcodeDescriptor"];
  [v4 encodeObject:self->_acbsBarcodeInfo forKey:@"ACBSBarcodeInfo"];
  if (self->_mrcDescriptor)
  {
    uint64_t v5 = (const void *)MRCDescriptorCopyAttributes();
    [v4 encodeObject:v5 forKey:@"MRCDescriptorAttributes"];
    CFRelease(v5);
  }
}

- (VNBarcodeObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VNBarcodeObservation;
  uint64_t v5 = [(VNRectangleObservation *)&v30 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbology"];
    uint64_t v7 = [v6 copy];
    symbology = v5->_symbology;
    v5->_symbology = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"barcodeDescriptor"];
    barcodeDescriptor = v5->_barcodeDescriptor;
    v5->_barcodeDescriptor = (CIBarcodeDescriptor *)v9;

    int v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"ACBSBarcodeInfo"];
    acbsBarcodeInfo = v5->_acbsBarcodeInfo;
    v5->_acbsBarcodeInfo = (NSDictionary *)v18;

    uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, v25, objc_opt_class(), 0);
    v27 = [v4 decodeObjectOfClasses:v26 forKey:@"MRCDescriptorAttributes"];

    if (v27) {
      [(VNBarcodeObservation *)v5 setMrcDescriptor:MRCDescriptorCreateWithAttributes()];
    }
    v28 = v5;
  }
  return v5;
}

- (void)_cacheMRCDescriptorValues
{
  if (self->_mrcDescriptor)
  {
    [(VNBarcodeObservation *)self _cachePayloadAndSupplementalPayload];
    uint64_t v3 = (NSData *)MRCDescriptorCopyAttribute();
    cachedPayloadData = self->_cachedPayloadData;
    self->_cachedPayloadData = v3;

    uint64_t v5 = (NSNumber *)MRCDescriptorCopyAttribute();
    cachedAppClipCodeMetadataValue = self->_cachedAppClipCodeMetadataValue;
    self->_cachedAppClipCodeMetadataValue = v5;

    uint64_t v7 = (NSNumber *)MRCDescriptorCopyAttribute();
    cachedIsColorInverted = self->_cachedIsColorInverted;
    self->_cachedIsColorInverted = v7;

    uint64_t v9 = (NSNumber *)MRCDescriptorCopyAttribute();
    cachedIsGS1DataCarrier = self->_cachedIsGS1DataCarrier;
    self->_cachedIsGS1DataCarrier = v9;

    int v11 = (NSData *)MRCDescriptorCopyAttribute();
    cachedSupplementalPayloadRawData = self->_cachedSupplementalPayloadRawData;
    self->_cachedSupplementalPayloadRawData = v11;

    id v17 = (id)MRCDescriptorCopyAttribute();
    switch([v17 integerValue])
    {
      case 2:
        id v13 = objc_alloc(NSNumber);
        uint64_t v14 = 1;
        break;
      case 3:
        id v13 = objc_alloc(NSNumber);
        uint64_t v14 = 2;
        break;
      case 4:
        id v13 = objc_alloc(NSNumber);
        uint64_t v14 = 3;
        break;
      case 5:
        id v13 = objc_alloc(NSNumber);
        uint64_t v14 = 4;
        break;
      default:
        id v13 = objc_alloc(NSNumber);
        uint64_t v14 = 0;
        break;
    }
    uint64_t v15 = (NSNumber *)[v13 initWithInteger:v14];
    cachedSupplementalCompositeType = self->_cachedSupplementalCompositeType;
    self->_cachedSupplementalCompositeType = v15;
  }
}

- (void)setMrcDescriptor:(__MRCDescriptor *)a3
{
  mrcDescriptor = self->_mrcDescriptor;
  if (mrcDescriptor != a3)
  {
    if (mrcDescriptor)
    {
      CFRelease(mrcDescriptor);
      self->_mrcDescriptor = 0;
    }
    if (a3)
    {
      self->_mrcDescriptor = (__MRCDescriptor *)CFRetain(a3);
      [(VNBarcodeObservation *)self _cacheMRCDescriptorValues];
    }
  }
}

- (void)dealloc
{
  mrcDescriptor = self->_mrcDescriptor;
  if (mrcDescriptor) {
    CFRelease(mrcDescriptor);
  }
  v4.receiver = self;
  v4.super_class = (Class)VNBarcodeObservation;
  [(VNBarcodeObservation *)&v4 dealloc];
}

- (VNBarcodeObservation)initWithOriginatingRequestSpecifier:(id)a3 symbology:(id)a4 descriptor:(id)a5 boundingBox:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = a3;
  id v14 = a5;
  uint64_t v21 = _validatedVNBarcodeSymbology(a4);
  if (!v21)
  {
    VNValidatedLog(4, @"invalid barcode symbology", v15, v16, v17, v18, v19, v20, (uint64_t)v27.receiver);
    id v22 = 0;
    goto LABEL_5;
  }
  v27.receiver = self;
  v27.super_class = (Class)VNBarcodeObservation;
  id v22 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:](&v27, sel_initWithOriginatingRequestSpecifier_boundingBox_, v13, x, y, width, height);
  if (v22)
  {
    uint64_t v23 = [v21 copy];
    uint64_t v24 = (void *)*((void *)v22 + 36);
    *((void *)v22 + 36) = v23;

    id v25 = v14;
    self = (VNBarcodeObservation *)*((void *)v22 + 37);
    *((void *)v22 + 37) = v25;
LABEL_5:
  }
  return (VNBarcodeObservation *)v22;
}

- (VNBarcodeObservation)initWithOriginatingRequestSpecifier:(id)a3 symbology:(id)a4 descriptor:(id)a5 mrcDescriptor:(__MRCDescriptor *)a6 topLeft:(CGPoint)a7 topRight:(CGPoint)a8 bottomRight:(CGPoint)a9 bottomLeft:(CGPoint)a10
{
  double y = a10.y;
  double x = a10.x;
  double v12 = a9.y;
  double v13 = a9.x;
  double v14 = a8.y;
  double v15 = a8.x;
  double v16 = a7.y;
  double v17 = a7.x;
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  if (a6)
  {
    self = -[VNBarcodeObservation initWithOriginatingRequestSpecifier:symbology:descriptor:topLeft:topRight:bottomRight:bottomLeft:](self, "initWithOriginatingRequestSpecifier:symbology:descriptor:topLeft:topRight:bottomRight:bottomLeft:", v22, v23, v24, v17, v16, v15, v14, v13, v12, x, y);
    if (self)
    {
      self->_mrcDescriptor = (__MRCDescriptor *)CFRetain(a6);
      [(VNBarcodeObservation *)self _cacheMRCDescriptorValues];
      self = self;
      a6 = (__MRCDescriptor *)self;
    }
    else
    {
      a6 = 0;
    }
  }

  return (VNBarcodeObservation *)a6;
}

- (VNBarcodeObservation)initWithOriginatingRequestSpecifier:(id)a3 symbology:(id)a4 descriptor:(id)a5 topLeft:(CGPoint)a6 topRight:(CGPoint)a7 bottomRight:(CGPoint)a8 bottomLeft:(CGPoint)a9
{
  double y = a9.y;
  double x = a9.x;
  double v11 = a8.y;
  double v12 = a8.x;
  double v13 = a7.y;
  double v14 = a7.x;
  double v15 = a6.y;
  double v16 = a6.x;
  id v20 = a3;
  id v21 = a5;
  v28 = _validatedVNBarcodeSymbology(a4);
  if (!v28)
  {
    VNValidatedLog(4, @"invalid barcode symbology", v22, v23, v24, v25, v26, v27, (uint64_t)v34.receiver);
    id v29 = 0;
    goto LABEL_5;
  }
  v34.receiver = self;
  v34.super_class = (Class)VNBarcodeObservation;
  id v29 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:](&v34, sel_initWithOriginatingRequestSpecifier_topLeft_topRight_bottomRight_bottomLeft_, v20, v16, v15, v14, v13, v12, v11, x, y);
  if (v29)
  {
    uint64_t v30 = [v28 copy];
    v31 = (void *)*((void *)v29 + 36);
    *((void *)v29 + 36) = v30;

    id v32 = v21;
    self = (VNBarcodeObservation *)*((void *)v29 + 37);
    *((void *)v29 + 37) = v32;
LABEL_5:
  }
  return (VNBarcodeObservation *)v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNDetectBarcodesRequest";
}

@end