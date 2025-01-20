@interface HMDDataStreamHAPPendingWrite
- (BOOL)isComplete;
- (HMDDataStreamHAPPendingWrite)initWithData:(id)a3 completion:(id)a4;
- (NSData)data;
- (id)completion;
- (id)popNextFrameUpToMaxLength:(unint64_t)a3;
- (unint64_t)bytesWritten;
- (void)setBytesWritten:(unint64_t)a3;
@end

@implementation HMDDataStreamHAPPendingWrite

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritten = a3;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (id)completion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (id)popNextFrameUpToMaxLength:(unint64_t)a3
{
  v5 = [(HMDDataStreamHAPPendingWrite *)self data];
  uint64_t v6 = [v5 length];
  unint64_t v7 = v6 - [(HMDDataStreamHAPPendingWrite *)self bytesWritten];

  if (v7 < a3) {
    a3 = v7;
  }
  v8 = [(HMDDataStreamHAPPendingWrite *)self data];
  v9 = objc_msgSend(v8, "subdataWithRange:", -[HMDDataStreamHAPPendingWrite bytesWritten](self, "bytesWritten"), a3);

  [(HMDDataStreamHAPPendingWrite *)self setBytesWritten:[(HMDDataStreamHAPPendingWrite *)self bytesWritten] + a3];
  return v9;
}

- (BOOL)isComplete
{
  v2 = self;
  v3 = [(HMDDataStreamHAPPendingWrite *)self data];
  unint64_t v4 = [v3 length];
  LOBYTE(v2) = v4 <= [(HMDDataStreamHAPPendingWrite *)v2 bytesWritten];

  return (char)v2;
}

- (HMDDataStreamHAPPendingWrite)initWithData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDDataStreamHAPPendingWrite;
  v8 = [(HMDDataStreamHAPPendingWrite *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    data = v8->_data;
    v8->_data = (NSData *)v9;

    v11 = _Block_copy(v7);
    id completion = v8->_completion;
    v8->_id completion = v11;
  }
  return v8;
}

@end