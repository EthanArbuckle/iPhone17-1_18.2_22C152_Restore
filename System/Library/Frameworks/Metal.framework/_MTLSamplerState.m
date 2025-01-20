@interface _MTLSamplerState
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (_MTLSamplerState)initWithDevice:(id)a3 samplerDescriptor:(id)a4;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)gpuAddress;
- (unint64_t)pixelFormat;
- (unint64_t)resourceIndex;
- (void)dealloc;
@end

@implementation _MTLSamplerState

- (_MTLSamplerState)initWithDevice:(id)a3 samplerDescriptor:(id)a4
{
  uint64_t v62 = 0;
  memset(v61, 0, sizeof(v61));
  _MTLMessageContextBegin_((uint64_t)v61, (uint64_t)"-[_MTLSamplerState initWithDevice:samplerDescriptor:]", 752, (uint64_t)a3, 12, (uint64_t)"New Sampler State Validation");
  if (!a3)
  {
    v56 = @"device must not be nil.";
    uint64_t v57 = 4;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v56 = @"device is not a MTLDevice.";
    uint64_t v57 = 8;
LABEL_24:
    _MTLMessageContextPush_((uint64_t)v61, v57, (uint64_t)v56, v7, v8, v9, v10, v11, (uint64_t)v60.receiver);
    if (a4) {
      goto LABEL_4;
    }
LABEL_25:
    v58 = @"desc must not be nil.";
    uint64_t v59 = 4;
    goto LABEL_27;
  }
  if (!a4) {
    goto LABEL_25;
  }
LABEL_4:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  v58 = @"desc is not a MTLSamplerDescriptor.";
  uint64_t v59 = 8;
LABEL_27:
  _MTLMessageContextPush_((uint64_t)v61, v59, (uint64_t)v58, v7, v8, v9, v10, v11, (uint64_t)v60.receiver);
LABEL_5:
  if ([a4 minFilter] >= 3) {
    _MTLMessageContextPush_((uint64_t)v61, 4, @"filter is not a valid MTLSamplerMinMagFilter.", v12, v13, v14, v15, v16, (uint64_t)v60.receiver);
  }
  if ([a4 magFilter] >= 3) {
    _MTLMessageContextPush_((uint64_t)v61, 4, @"filter is not a valid MTLSamplerMinMagFilter.", v17, v18, v19, v20, v21, (uint64_t)v60.receiver);
  }
  if ((unint64_t)[a4 mipFilter] >= 3) {
    _MTLMessageContextPush_((uint64_t)v61, 4, @"mipFilter is not a valid MTLSamplerMipFilter.", v22, v23, v24, v25, v26, (uint64_t)v60.receiver);
  }
  if ((unint64_t)[a4 borderColor] >= 4) {
    _MTLMessageContextPush_((uint64_t)v61, 4, @"borderColor is not a valid MTLSamplerBorderColorSPI.", v27, v28, v29, v30, v31, (uint64_t)v60.receiver);
  }
  unint64_t v32 = [a4 compareFunction];
  validateMTLCompareFunction(v32, (uint64_t)v61, v33, v34, v35, v36, v37, v38, (uint64_t)v60.receiver);
  if ((unint64_t)[a4 sAddressMode] >= 7) {
    _MTLMessageContextPush_((uint64_t)v61, 4, @"addressMode is not a valid MTLSamplerAddressMode.", v39, v40, v41, v42, v43, (uint64_t)v60.receiver);
  }
  if ((unint64_t)[a4 tAddressMode] >= 7) {
    _MTLMessageContextPush_((uint64_t)v61, 4, @"addressMode is not a valid MTLSamplerAddressMode.", v44, v45, v46, v47, v48, (uint64_t)v60.receiver);
  }
  if ((unint64_t)[a4 rAddressMode] >= 7) {
    _MTLMessageContextPush_((uint64_t)v61, 4, @"addressMode is not a valid MTLSamplerAddressMode.", v49, v50, v51, v52, v53, (uint64_t)v60.receiver);
  }
  _MTLMessageContextEnd((uint64_t)v61);
  v60.receiver = self;
  v60.super_class = (Class)_MTLSamplerState;
  v54 = [(_MTLSamplerState *)&v60 init];
  if (v54)
  {
    v54->_device = (MTLDevice *)a3;
    v54->_label = (NSString *)(id)[a4 label];
    v54->_pixelFormat = [a4 pixelFormat];
  }
  return v54;
}

- (void)dealloc
{
  self->_label = 0;
  v3.receiver = self;
  v3.super_class = (Class)_MTLSamplerState;
  [(_MTLSamplerState *)&v3 dealloc];
}

- (id)formattedDescription:(unint64_t)a3
{
  v13[6] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)_MTLSamplerState;
  uint64_t v7 = [(_MTLSamplerState *)&v12 description];
  v13[0] = v5;
  v13[1] = @"label =";
  label = @"<none>";
  device = self->_device;
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  v13[2] = label;
  v13[3] = v5;
  v13[4] = @"device =";
  if (device) {
    uint64_t v10 = (__CFString *)[(MTLDevice *)device formattedDescription:v4];
  }
  else {
    uint64_t v10 = @"<null>";
  }
  v13[5] = v10;
  return (id)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 6), "componentsJoinedByString:", @" "];
}

- (NSString)description
{
  return (NSString *)[(_MTLSamplerState *)self formattedDescription:0];
}

- (MTLDevice)device
{
  return self->_device;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (unint64_t)gpuAddress
{
  return self->_gpuAddress;
}

@end