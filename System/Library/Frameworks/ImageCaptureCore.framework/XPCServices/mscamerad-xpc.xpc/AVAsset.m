@interface AVAsset
- (BOOL)decodableVideoNamed:(id)a3 width:(double *)a4 height:(double *)a5;
- (unsigned)videoOrientation;
@end

@implementation AVAsset

- (unsigned)videoOrientation
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x5010000000;
  v16 = &unk_1000329B7;
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v17 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v18 = v4;
  long long v19 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000149B8;
  v10[3] = &unk_100034B80;
  v12 = &v13;
  v5 = v3;
  v11 = v5;
  [(AVAsset *)self loadTracksWithMediaType:AVMediaTypeVideo completionHandler:v10];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  double v6 = v14[4];
  if (v6 != 0.0) {
    goto LABEL_10;
  }
  double v7 = v14[5];
  if (v7 != 1.0 || v14[6] != -1.0 || v14[7] != 0.0)
  {
    if (v7 == -1.0 && v14[6] == 1.0 && v14[7] == 0.0)
    {
      unsigned int v8 = 6;
      goto LABEL_11;
    }
LABEL_10:
    unsigned int v8 = 1;
    goto LABEL_11;
  }
  unsigned int v8 = 8;
LABEL_11:
  if (v6 == 1.0 && v14[5] == 0.0 && v14[6] == 0.0 && v14[7] == 1.0) {
    unsigned int v8 = 1;
  }
  if (v6 == -1.0 && v14[5] == 0.0 && v14[6] == 0.0 && v14[7] == -1.0) {
    unsigned int v8 = 3;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)decodableVideoNamed:(id)a3 width:(double *)a4 height:(double *)a5
{
  id v8 = a3;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3010000000;
  v23[3] = &unk_1000329B7;
  CGSize v24 = CGSizeZero;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3010000000;
  v21[3] = &unk_1000329B7;
  CGSize v22 = v24;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100014C1C;
  v13[3] = &unk_100034BA8;
  v16 = &v25;
  long long v17 = v23;
  long long v18 = v21;
  long long v19 = a5;
  v20 = a4;
  id v10 = v8;
  id v14 = v10;
  v11 = v9;
  uint64_t v15 = v11;
  [(AVAsset *)self loadTracksWithMediaType:AVMediaTypeVideo completionHandler:v13];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((unsigned char *)v26 + 24);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  return (char)self;
}

@end