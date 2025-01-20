@interface SHRecordingBuffer
- (SHAudioTap)tap;
- (SHRecordingBuffer)initWithTap:(id)a3;
- (SHRecordingBuffer)initWithTap:(id)a3 signatureGenerator:(id)a4;
- (SHSignatureGenerator)signatureGenerator;
- (void)setSignatureGenerator:(id)a3;
@end

@implementation SHRecordingBuffer

- (SHRecordingBuffer)initWithTap:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SHSignatureGenerator) initSignatureRingBufferWithDuration:3.0];
  v6 = [(SHRecordingBuffer *)self initWithTap:v4 signatureGenerator:v5];

  return v6;
}

- (SHRecordingBuffer)initWithTap:(id)a3 signatureGenerator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SHRecordingBuffer;
  v9 = [(SHRecordingBuffer *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tap, a3);
    objc_storeStrong((id *)&v10->_signatureGenerator, a4);
    objc_initWeak(&location, v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100009CE4;
    v12[3] = &unk_100074E80;
    id v13 = v8;
    objc_copyWeak(&v14, &location);
    [(SHAudioTap *)v10->_tap setCompletion:v12];
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }

  return v10;
}

- (SHAudioTap)tap
{
  return self->_tap;
}

- (SHSignatureGenerator)signatureGenerator
{
  return self->_signatureGenerator;
}

- (void)setSignatureGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureGenerator, 0);

  objc_storeStrong((id *)&self->_tap, 0);
}

@end