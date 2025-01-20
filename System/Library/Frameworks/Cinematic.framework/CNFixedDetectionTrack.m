@interface CNFixedDetectionTrack
- (CNDetection)originalDetection;
- (CNFixedDetectionTrack)initWithFocusDisparity:(float)focusDisparity;
- (CNFixedDetectionTrack)initWithOriginalDetection:(CNDetection *)originalDetection;
- (float)focusDisparity;
@end

@implementation CNFixedDetectionTrack

- (CNFixedDetectionTrack)initWithFocusDisparity:(float)focusDisparity
{
  id v5 = objc_alloc(MEMORY[0x263F5F2B0]);
  *(float *)&double v6 = focusDisparity;
  v7 = (void *)[v5 initWithFocusDistance:v6];
  v10.receiver = self;
  v10.super_class = (Class)CNFixedDetectionTrack;
  v8 = [(CNDetectionTrack *)&v10 _initWithInternal:v7];

  return v8;
}

- (CNFixedDetectionTrack)initWithOriginalDetection:(CNDetection *)originalDetection
{
  v4 = (objc_class *)MEMORY[0x263F5F2B0];
  id v5 = originalDetection;
  id v6 = [v4 alloc];
  v7 = [(CNDetection *)v5 internalDetection];

  v8 = (void *)[v7 copy];
  v9 = (void *)[v6 initWithDetection:v8];
  v12.receiver = self;
  v12.super_class = (Class)CNFixedDetectionTrack;
  objc_super v10 = [(CNDetectionTrack *)&v12 _initWithInternal:v9];

  return v10;
}

- (float)focusDisparity
{
  v2 = [(CNFixedDetectionTrack *)self _internalFixedTrack];
  [v2 focusDistance];
  float v4 = v3;

  return v4;
}

- (CNDetection)originalDetection
{
  v2 = [(CNFixedDetectionTrack *)self _internalFixedTrack];
  float v3 = [v2 detection];

  if (v3 && ([v3 time], (v7 & 1) != 0) && (objc_msgSend(v3, "time"), (v6 & 0x10) != 0)) {
    id v4 = 0;
  }
  else {
    id v4 = +[CNDetection _copyDetectionFromInternal:v3];
  }

  return (CNDetection *)v4;
}

@end