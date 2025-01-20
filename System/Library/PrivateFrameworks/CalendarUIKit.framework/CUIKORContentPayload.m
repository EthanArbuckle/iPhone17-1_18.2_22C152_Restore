@interface CUIKORContentPayload
- (CUIKORContentPayload)initWithRequestId:(int64_t)a3 requestOptions:(unint64_t)a4 backgroundImage:(id)a5 textImage:(id)a6 textDrawInfo:(id)a7 travelTimeImage:(id)a8 travelTimeString:(id)a9;
- (CUIKORTextDrawInfo)textDrawInfo;
- (NSAttributedString)travelTimeString;
- (UIImage)backgroundImage;
- (UIImage)textImage;
- (UIImage)travelTimeImage;
- (int64_t)requestId;
- (unint64_t)requestOptions;
@end

@implementation CUIKORContentPayload

- (unint64_t)requestOptions
{
  return self->_requestOptions;
}

- (UIImage)textImage
{
  return self->_textImage;
}

- (int64_t)requestId
{
  return self->_requestId;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (CUIKORContentPayload)initWithRequestId:(int64_t)a3 requestOptions:(unint64_t)a4 backgroundImage:(id)a5 textImage:(id)a6 textDrawInfo:(id)a7 travelTimeImage:(id)a8 travelTimeString:(id)a9
{
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)CUIKORContentPayload;
  v18 = [(CUIKORContentPayload *)&v24 init];
  v19 = v18;
  if (v18)
  {
    v18->_requestId = a3;
    v18->_requestOptions = a4;
    objc_storeStrong((id *)&v18->_backgroundImage, a5);
    objc_storeStrong((id *)&v19->_textImage, a6);
    objc_storeStrong((id *)&v19->_textDrawInfo, a7);
    objc_storeStrong((id *)&v19->_travelTimeImage, a8);
    objc_storeStrong((id *)&v19->_travelTimeString, a9);
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelTimeString, 0);
  objc_storeStrong((id *)&self->_travelTimeImage, 0);
  objc_storeStrong((id *)&self->_textDrawInfo, 0);
  objc_storeStrong((id *)&self->_textImage, 0);

  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

- (CUIKORTextDrawInfo)textDrawInfo
{
  return self->_textDrawInfo;
}

- (UIImage)travelTimeImage
{
  return self->_travelTimeImage;
}

- (NSAttributedString)travelTimeString
{
  return self->_travelTimeString;
}

@end