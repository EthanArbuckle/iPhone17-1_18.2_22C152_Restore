@interface _MTLDepthStencilState
- (BOOL)readsDepth;
- (BOOL)readsStencil;
- (BOOL)writesDepth;
- (BOOL)writesStencil;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (_MTLDepthStencilState)initWithDevice:(id)a3 depthStencilDescriptor:(id)a4;
- (id)formattedDescription:(unint64_t)a3;
- (void)dealloc;
@end

@implementation _MTLDepthStencilState

- (_MTLDepthStencilState)initWithDevice:(id)a3 depthStencilDescriptor:(id)a4
{
  uint64_t v65 = 0;
  memset(v64, 0, sizeof(v64));
  _MTLMessageContextBegin_((uint64_t)v64, (uint64_t)"-[_MTLDepthStencilState initWithDevice:depthStencilDescriptor:]", 479, (uint64_t)a3, 10, (uint64_t)"Creation Depth Stencil State");
  if (!a3)
  {
    v59 = @"device must not be nil.";
    uint64_t v60 = 4;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v59 = @"device is not a MTLDevice.";
    uint64_t v60 = 8;
LABEL_28:
    _MTLMessageContextPush_((uint64_t)v64, v60, (uint64_t)v59, v7, v8, v9, v10, v11, (uint64_t)v63.receiver);
    if (a4) {
      goto LABEL_4;
    }
LABEL_29:
    v61 = @"desc must not be nil.";
    uint64_t v62 = 4;
    goto LABEL_31;
  }
  if (!a4) {
    goto LABEL_29;
  }
LABEL_4:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  v61 = @"desc is not a MTLDepthStencilDescriptor.";
  uint64_t v62 = 8;
LABEL_31:
  _MTLMessageContextPush_((uint64_t)v64, v62, (uint64_t)v61, v7, v8, v9, v10, v11, (uint64_t)v63.receiver);
LABEL_5:
  if ((unint64_t)[a4 depthCompareFunction] >= 8) {
    _MTLMessageContextPush_((uint64_t)v64, 4, @"function is not a valid MTLCompareFunction.", v12, v13, v14, v15, v16, (uint64_t)v63.receiver);
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "backFaceStencil"), "stencilCompareFunction") >= 8) {
    _MTLMessageContextPush_((uint64_t)v64, 4, @"function is not a valid MTLCompareFunction.", v17, v18, v19, v20, v21, (uint64_t)v63.receiver);
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "backFaceStencil"), "stencilFailureOperation") >= 8) {
    _MTLMessageContextPush_((uint64_t)v64, 4, @"operation is not a valid MTLStencilOperation.", v22, v23, v24, v25, v26, (uint64_t)v63.receiver);
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "backFaceStencil"), "depthFailureOperation") >= 8) {
    _MTLMessageContextPush_((uint64_t)v64, 4, @"operation is not a valid MTLStencilOperation.", v27, v28, v29, v30, v31, (uint64_t)v63.receiver);
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "backFaceStencil"), "depthStencilPassOperation") >= 8) {
    _MTLMessageContextPush_((uint64_t)v64, 4, @"operation is not a valid MTLStencilOperation.", v32, v33, v34, v35, v36, (uint64_t)v63.receiver);
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "frontFaceStencil"), "stencilCompareFunction") >= 8) {
    _MTLMessageContextPush_((uint64_t)v64, 4, @"function is not a valid MTLCompareFunction.", v37, v38, v39, v40, v41, (uint64_t)v63.receiver);
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "frontFaceStencil"), "stencilFailureOperation") >= 8) {
    _MTLMessageContextPush_((uint64_t)v64, 4, @"operation is not a valid MTLStencilOperation.", v42, v43, v44, v45, v46, (uint64_t)v63.receiver);
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "frontFaceStencil"), "depthFailureOperation") >= 8) {
    _MTLMessageContextPush_((uint64_t)v64, 4, @"operation is not a valid MTLStencilOperation.", v47, v48, v49, v50, v51, (uint64_t)v63.receiver);
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "frontFaceStencil"), "depthStencilPassOperation") >= 8) {
    _MTLMessageContextPush_((uint64_t)v64, 4, @"operation is not a valid MTLStencilOperation.", v52, v53, v54, v55, v56, (uint64_t)v63.receiver);
  }
  _MTLMessageContextEnd((uint64_t)v64);
  v63.receiver = self;
  v63.super_class = (Class)_MTLDepthStencilState;
  v57 = [(_MTLDepthStencilState *)&v63 init];
  if (v57)
  {
    v57->_device = (MTLDevice *)a3;
    v57->_label = (NSString *)objc_msgSend((id)objc_msgSend(a4, "label"), "copy");
  }
  return v57;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLDepthStencilState;
  [(_MTLDepthStencilState *)&v3 dealloc];
}

- (id)formattedDescription:(unint64_t)a3
{
  v14[6] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)_MTLDepthStencilState;
  uint64_t v7 = [(_MTLDepthStencilState *)&v13 description];
  v14[0] = v5;
  v14[1] = @"label =";
  label = @"<none>";
  device = self->_device;
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  v14[2] = label;
  v14[3] = v5;
  v14[4] = @"device =";
  uint64_t v10 = [(MTLDevice *)device formattedDescription:v4];
  uint64_t v11 = @"<null>";
  if (v10) {
    uint64_t v11 = (__CFString *)v10;
  }
  v14[5] = v11;
  return (id)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 6), "componentsJoinedByString:", @" "];
}

- (NSString)description
{
  return (NSString *)[(_MTLDepthStencilState *)self formattedDescription:0];
}

- (BOOL)readsDepth
{
  return 1;
}

- (BOOL)writesDepth
{
  return 1;
}

- (BOOL)readsStencil
{
  return 1;
}

- (BOOL)writesStencil
{
  return 1;
}

- (MTLDevice)device
{
  return self->_device;
}

- (NSString)label
{
  return self->_label;
}

@end