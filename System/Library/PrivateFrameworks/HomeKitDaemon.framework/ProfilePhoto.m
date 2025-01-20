@interface ProfilePhoto
- (NSData)photoData;
- (NSValue)cropRect;
- (void)setCropRect:(id)a3;
- (void)setPhotoData:(id)a3;
@end

@implementation ProfilePhoto

- (NSValue)cropRect
{
  return (NSValue *)*(id *)self->cropRect;
}

- (void)setCropRect:(id)a3
{
  swift_beginAccess();
  v5 = *(void **)self->cropRect;
  *(void *)self->cropRect = a3;
  id v6 = a3;
}

- (NSData)photoData
{
  swift_beginAccess();
  uint64_t v4 = *(void *)self->photoData;
  unint64_t v3 = *(void *)&self->photoData[8];
  sub_22F5418A8(v4, v3);
  v5 = (void *)_s10Foundation4DataV13HomeKitDaemonE02nsB0So6NSDataCvg_0();
  sub_22F5417E0(v4, v3);
  return (NSData *)v5;
}

- (void)setPhotoData:(id)a3
{
  id v4 = a3;
  swift_retain();
  uint64_t v5 = sub_2302DD180();
  uint64_t v7 = v6;

  swift_beginAccess();
  uint64_t v8 = *(void *)self->photoData;
  unint64_t v9 = *(void *)&self->photoData[8];
  *(void *)self->photoData = v5;
  *(void *)&self->photoData[8] = v7;
  sub_22F5417E0(v8, v9);
  swift_release();
}

@end