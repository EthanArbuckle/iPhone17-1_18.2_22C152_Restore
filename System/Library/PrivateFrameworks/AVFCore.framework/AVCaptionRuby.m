@interface AVCaptionRuby
+ (BOOL)supportsSecureCoding;
- (AVCaptionRuby)init;
- (AVCaptionRuby)initWithCoder:(id)a3;
- (AVCaptionRuby)initWithFigCaptionData:(OpaqueFigCaptionData *)a3;
- (AVCaptionRuby)initWithText:(NSString *)text;
- (AVCaptionRuby)initWithText:(NSString *)text position:(AVCaptionRubyPosition)position alignment:(AVCaptionRubyAlignment)alignment;
- (AVCaptionRubyAlignment)alignment;
- (AVCaptionRubyPosition)position;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (OpaqueFigCaptionData)copyFigCaptionData;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVCaptionRuby

- (AVCaptionRuby)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_initWithText_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVCaptionRuby)initWithText:(NSString *)text
{
  v7.receiver = self;
  v7.super_class = (Class)AVCaptionRuby;
  v4 = [(AVCaptionRuby *)&v7 init];
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(AVCaptionRubyInternal);
    v4->_internal = v5;
    if (v5)
    {
      CFRetain(v5);
      v4->_internal->text = (NSString *)[(NSString *)text copy];
      v4->_internal->position = 0;
      v4->_internal->alignment = 2;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (AVCaptionRuby)initWithText:(NSString *)text position:(AVCaptionRubyPosition)position alignment:(AVCaptionRubyAlignment)alignment
{
  result = [(AVCaptionRuby *)self initWithText:text];
  if (result)
  {
    result->_internal->position = position;
    result->_internal->alignment = alignment;
  }
  return result;
}

- (AVCaptionRuby)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AVCaptionRubyArchiveKeyText"];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([a3 containsValueForKey:@"AVCaptionRubyArchiveKeyPosition"]) {
      uint64_t v7 = [a3 decodeIntegerForKey:@"AVCaptionRubyArchiveKeyPosition"];
    }
    else {
      uint64_t v7 = 0;
    }
    if ([a3 containsValueForKey:@"AVCaptionRubyArchiveKeyAlignment"]) {
      uint64_t v9 = [a3 decodeIntegerForKey:@"AVCaptionRubyArchiveKeyAlignment"];
    }
    else {
      uint64_t v9 = 2;
    }
    return [(AVCaptionRuby *)self initWithText:v6 position:v7 alignment:v9];
  }
  else
  {

    return 0;
  }
}

- (AVCaptionRuby)initWithFigCaptionData:(OpaqueFigCaptionData *)a3
{
  CFTypeRef v22 = 0;
  CFTypeRef v23 = 0;
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigCaptionDataGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (!v7) {
    goto LABEL_18;
  }
  uint64_t v8 = *MEMORY[0x1E4F1CF80];
  if (v7(CMBaseObject, *MEMORY[0x1E4F1FF50], *MEMORY[0x1E4F1CF80], &v23)) {
    goto LABEL_18;
  }
  uint64_t v9 = FigCaptionDataGetCMBaseObject();
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  uint64_t v11 = v10 ? v10 : 0;
  if ((v12 = *(unsigned int (**)(uint64_t, void, uint64_t, CFTypeRef *))(v11 + 48)) == 0
    || v12(v9, *MEMORY[0x1E4F1FF30], v8, &v22)
    || ((uint64_t v13 = FigCaptionDataGetCMBaseObject(), (v14 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v15 = 0)
      : (uint64_t v15 = v14),
        (v16 = *(unsigned int (**)(uint64_t, void, uint64_t, CFTypeRef *))(v15 + 48)) == 0
     || v16(v13, *MEMORY[0x1E4F1FF28], v8, &cf)))
  {
LABEL_18:

    v17 = 0;
  }
  else
  {
    if (v22) {
      FigCaptionDynamicStyleGetInitialValue();
    }
    if (cf) {
      FigCaptionDynamicStyleGetInitialValue();
    }
    if (FigCFEqual()) {
      BOOL v19 = 0;
    }
    else {
      BOOL v19 = FigCFEqual() != 0;
    }
    if (FigCFEqual())
    {
      uint64_t v20 = 0;
    }
    else if (FigCFEqual())
    {
      uint64_t v20 = 1;
    }
    else if (FigCFEqual())
    {
      uint64_t v20 = 2;
    }
    else if (FigCFEqual())
    {
      uint64_t v20 = 3;
    }
    else
    {
      uint64_t v20 = 2;
    }
    v17 = [(AVCaptionRuby *)self initWithText:v23 position:v19 alignment:v20];
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v23) {
    CFRelease(v23);
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:2 forKey:@"AVCaptionRubyArchiveKeyVersion"];
  objc_msgSend(a3, "encodeObject:forKey:", -[AVCaptionRuby text](self, "text"), @"AVCaptionRubyArchiveKeyText");
  objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaptionRuby position](self, "position"), @"AVCaptionRubyArchiveKeyPosition");
  AVCaptionRubyAlignment v5 = [(AVCaptionRuby *)self alignment];
  [a3 encodeInteger:v5 forKey:@"AVCaptionRubyArchiveKeyAlignment"];
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCaptionRuby;
  [(AVCaptionRuby *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  BOOL result = 0;
  if (objc_opt_isKindOfClass())
  {
    if (-[NSString isEqual:](-[AVCaptionRuby text](self, "text"), "isEqual:", [a3 text]))
    {
      AVCaptionRubyPosition v5 = [(AVCaptionRuby *)self position];
      if (v5 == [a3 position])
      {
        AVCaptionRubyAlignment v6 = [(AVCaptionRuby *)self alignment];
        if (v6 == [a3 alignment]) {
          return 1;
        }
      }
    }
  }
  return result;
}

- (OpaqueFigCaptionData)copyFigCaptionData
{
  if (FigCaptionDataCreateMutable()) {
    return 0;
  }
  text = self->_internal->text;
  uint64_t CMBaseObject = FigCaptionDataGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  uint64_t v6 = v5 ? v5 : 0;
  uint64_t v7 = *(unsigned int (**)(uint64_t, void, NSString *))(v6 + 56);
  if (!v7 || v7(CMBaseObject, *MEMORY[0x1E4F1FF50], text)) {
    return 0;
  }
  internal = self->_internal;
  int64_t position = internal->position;
  if (position == 1)
  {
    uint64_t v10 = (uint64_t *)MEMORY[0x1E4F20108];
    goto LABEL_11;
  }
  if (!position)
  {
    uint64_t v10 = (uint64_t *)MEMORY[0x1E4F20110];
LABEL_11:
    uint64_t v11 = *v10;
    goto LABEL_13;
  }
  uint64_t v11 = 0;
LABEL_13:
  switch(internal->alignment)
  {
    case 0:
      v12 = (uint64_t *)MEMORY[0x1E4F20100];
      goto LABEL_20;
    case 1:
      v12 = (uint64_t *)MEMORY[0x1E4F200D8];
      goto LABEL_20;
    case 2:
      v12 = (uint64_t *)MEMORY[0x1E4F200E8];
      goto LABEL_20;
    case 3:
      v12 = (uint64_t *)MEMORY[0x1E4F200E0];
LABEL_20:
      uint64_t v13 = *v12;
      if (v11) {
        goto LABEL_21;
      }
      goto LABEL_27;
    default:
      uint64_t v13 = 0;
      if (!v11) {
        goto LABEL_27;
      }
LABEL_21:
      if (!FigCaptionDynamicStyleCreate())
      {
        uint64_t v14 = FigCaptionDataGetCMBaseObject();
        uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v16 = v15 ? v15 : 0;
        v17 = *(unsigned int (**)(uint64_t, void, void))(v16 + 56);
        if (v17)
        {
          if (!v17(v14, *MEMORY[0x1E4F1FF30], 0))
          {
LABEL_27:
            if (v13 && !FigCaptionDynamicStyleCreate())
            {
              uint64_t v18 = FigCaptionDataGetCMBaseObject();
              uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
              if (v19) {
                uint64_t v20 = v19;
              }
              else {
                uint64_t v20 = 0;
              }
              v21 = *(uint64_t (**)(uint64_t, void, void))(v20 + 56);
              if (v21) {
                v21(v18, *MEMORY[0x1E4F1FF28], 0);
              }
            }
          }
        }
      }
      break;
  }
  return 0;
}

- (NSString)text
{
  return self->_internal->text;
}

- (AVCaptionRubyPosition)position
{
  return self->_internal->position;
}

- (AVCaptionRubyAlignment)alignment
{
  return self->_internal->alignment;
}

- (id)description
{
  if ([(AVCaptionRuby *)self position])
  {
    if ([(AVCaptionRuby *)self position] == AVCaptionRubyPositionAfter) {
      v3 = @"after";
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = @"before";
  }
  if ([(AVCaptionRuby *)self alignment])
  {
    if ([(AVCaptionRuby *)self alignment] == AVCaptionRubyAlignmentCenter)
    {
      objc_super v4 = @"center";
    }
    else if ([(AVCaptionRuby *)self alignment] == AVCaptionRubyAlignmentDistributeSpaceBetween)
    {
      objc_super v4 = @"spaceBetween";
    }
    else if ([(AVCaptionRuby *)self alignment] == AVCaptionRubyAlignmentDistributeSpaceAround)
    {
      objc_super v4 = @"spaceAround";
    }
    else
    {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = @"start";
  }
  uint64_t v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  return (id)[v5 stringWithFormat:@"<%@: %p, text=%@ position=%@ alignment=%@>", NSStringFromClass(v6), self, -[AVCaptionRuby text](self, "text"), v3, v4];
}

@end