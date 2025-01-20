@interface NSCoder(CVPixelBuffer)
- (CFTypeRef)decodeCVPixelBufferForKey:()CVPixelBuffer;
- (CFTypeRef)decodeCVPixelBufferForKey:()CVPixelBuffer expectSourceMedia:;
- (void)encodeCVPixelBuffer:()CVPixelBuffer forKey:;
@end

@implementation NSCoder(CVPixelBuffer)

- (CFTypeRef)decodeCVPixelBufferForKey:()CVPixelBuffer
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if ([v5 pixelBuffer])
  {
    CFTypeRef v6 = CFRetain((CFTypeRef)[v5 pixelBuffer]);
    CFTypeRef v7 = CFAutorelease(v6);
  }
  else
  {
    CFTypeRef v7 = 0;
  }

  return v7;
}

- (CFTypeRef)decodeCVPixelBufferForKey:()CVPixelBuffer expectSourceMedia:
{
  id v6 = a3;
  CFTypeRef v7 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v6];

  if (a4 && [v7 pixelBuffer]) {
    [v7 transferSourceMedia];
  }
  if ([v7 pixelBuffer])
  {
    CFTypeRef v8 = CFRetain((CFTypeRef)[v7 pixelBuffer]);
    CFTypeRef v9 = CFAutorelease(v8);
  }
  else
  {
    CFTypeRef v9 = 0;
  }

  return v9;
}

- (void)encodeCVPixelBuffer:()CVPixelBuffer forKey:
{
  id v7 = a4;
  id v6 = [[CVPixelBufferCoder alloc] initWithCVPixelBuffer:a3];
  if (v6) {
    [a1 encodeObject:v6 forKey:v7];
  }
}

@end