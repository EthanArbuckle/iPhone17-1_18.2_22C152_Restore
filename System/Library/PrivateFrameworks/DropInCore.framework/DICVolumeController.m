@interface DICVolumeController
- (BOOL)setVolumeForCategory:(id)a3 volume:(float)a4 error:(id *)a5;
- (BOOL)setVolumeForPhoneCall:(float)a3 error:(id *)a4;
- (id)volumeForCategory:(id)a3 error:(id *)a4;
- (id)volumeForPhoneCallWithError:(id *)a3;
@end

@implementation DICVolumeController

- (id)volumeForCategory:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F544E0];
  id v6 = a3;
  v7 = [v5 sharedAVSystemController];
  int v12 = 0;
  int v8 = [v7 getVolume:&v12 forCategory:v6];

  if (v8)
  {
    LODWORD(v9) = v12;
    v10 = [NSNumber numberWithFloat:v9];
  }
  else
  {
    v10 = 0;
    if (a4) {
      *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.dropincore.volumecontroller" code:1 userInfo:0];
    }
  }

  return v10;
}

- (BOOL)setVolumeForCategory:(id)a3 volume:(float)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263F544E0];
  id v8 = a3;
  double v9 = [v7 sharedAVSystemController];
  *(float *)&double v10 = a4;
  char v11 = [v9 setVolumeTo:v8 forCategory:v10];

  if (a5 && (v11 & 1) == 0) {
    *a5 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.dropincore.volumecontroller" code:2 userInfo:0];
  }

  return v11;
}

- (id)volumeForPhoneCallWithError:(id *)a3
{
  return [(DICVolumeController *)self volumeForCategory:@"PhoneCall" error:a3];
}

- (BOOL)setVolumeForPhoneCall:(float)a3 error:(id *)a4
{
  return -[DICVolumeController setVolumeForCategory:volume:error:](self, "setVolumeForCategory:volume:error:", @"PhoneCall", a4);
}

@end