@interface VKLabelMarkerShield(MKTransitArtworkExtras)
- (id)shieldColorString;
@end

@implementation VKLabelMarkerShield(MKTransitArtworkExtras)

- (id)shieldColorString
{
  [a1 color];
  float v2 = v1;
  float v4 = v3;
  float v6 = v5;
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%.2X", (float)(v7 * 255.0));
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%.2X", (float)(v2 * 255.0));
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%.2X", (float)(v4 * 255.0));
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%.2X", (float)(v6 * 255.0));
  v12 = [NSString stringWithFormat:@"%@%@%@%@", v8, v9, v10, v11];

  return v12;
}

@end