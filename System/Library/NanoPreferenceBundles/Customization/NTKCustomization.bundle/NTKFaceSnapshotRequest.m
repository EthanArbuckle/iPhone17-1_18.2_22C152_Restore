@interface NTKFaceSnapshotRequest
- (BOOL)isReady;
- (NSDate)creationDate;
- (NSDictionary)options;
- (NTKFace)face;
- (NTKFaceSnapshotRequest)initWithFace:(id)a3 options:(id)a4 completion:(id)a5;
- (id)completion;
- (void)setCompletion:(id)a3;
@end

@implementation NTKFaceSnapshotRequest

- (NTKFaceSnapshotRequest)initWithFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NTKFaceSnapshotRequest;
  v12 = [(NTKFaceSnapshotRequest *)&v20 init];
  if (v12)
  {
    uint64_t v13 = +[NSDate date];
    creationDate = v12->_creationDate;
    v12->_creationDate = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_face, a3);
    v15 = (NSDictionary *)[v10 copy];
    options = v12->_options;
    v12->_options = v15;

    id v17 = [v11 copy];
    id completion = v12->_completion;
    v12->_id completion = v17;
  }
  return v12;
}

- (BOOL)isReady
{
  [(NTKFaceSnapshotRequest *)self face];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_B014;
  v12 = &unk_24950;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v2;
  v14 = &v15;
  [v2 enumerateComplicationSlotsWithBlock:&v9];
  if (*((unsigned char *)v16 + 24))
  {
    v3 = objc_msgSend(v2, "device", v9, v10, v11, v12);
    v4 = [v3 nrDeviceUUID];
    if (v4)
    {
      v5 = [(id)qword_2E448 objectForKey:v4];
      unsigned __int8 v6 = [v5 hasLoaded];
    }
    else
    {
      unsigned __int8 v6 = 1;
    }
    char v7 = v6 & byte_2E450;
  }
  else
  {
    char v7 = 1;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NTKFace)face
{
  return self->_face;
}

- (NSDictionary)options
{
  return self->_options;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_face, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end