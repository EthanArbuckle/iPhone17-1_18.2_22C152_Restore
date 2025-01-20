@interface NSURL
- (BOOL)bl_isInVolume:(id)a3;
@end

@implementation NSURL

- (BOOL)bl_isInVolume:(id)a3
{
  id v4 = a3;
  if ([(NSURL *)self isFileURL])
  {
    v5 = [(NSURL *)self path];
    unsigned __int8 v6 = objc_msgSend(v5, "bl_isInVolume:", v4);
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

@end