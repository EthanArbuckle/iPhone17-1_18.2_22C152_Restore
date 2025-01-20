@interface AVTStickerTask
+ (id)stickerTaskForSchedulerTask:(id)a3 avatarRecordIdentifier:(id)a4 indexPath:(id)a5 stickerType:(unint64_t)a6;
- (AVTStickerTask)initWithTask:(id)a3 avatarRecordIdentifier:(id)a4 indexPath:(id)a5 stickerType:(unint64_t)a6;
- (NSIndexPath)indexPath;
- (NSString)avatarRecordIdentifier;
- (id)description;
- (id)task;
- (unint64_t)stickerType;
@end

@implementation AVTStickerTask

- (AVTStickerTask)initWithTask:(id)a3 avatarRecordIdentifier:(id)a4 indexPath:(id)a5 stickerType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTStickerTask;
  v13 = [(AVTStickerTask *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    id task = v13->_task;
    v13->_id task = (id)v14;

    objc_storeStrong((id *)&v13->_avatarRecordIdentifier, a4);
    objc_storeStrong((id *)&v13->_indexPath, a5);
    v13->_stickerType = a6;
  }

  return v13;
}

+ (id)stickerTaskForSchedulerTask:(id)a3 avatarRecordIdentifier:(id)a4 indexPath:(id)a5 stickerType:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTask:v11 avatarRecordIdentifier:v10 indexPath:v9 stickerType:a6];

  return v12;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)AVTStickerTask;
  v3 = [(AVTStickerTask *)&v11 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTStickerTask *)self avatarRecordIdentifier];
  [v4 appendFormat:@" identifier: %@", v5];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AVTStickerTask stickerType](self, "stickerType"));
  [v4 appendFormat:@" stickerType: %@", v6];

  v7 = [(AVTStickerTask *)self indexPath];

  if (v7)
  {
    v8 = [(AVTStickerTask *)self indexPath];
    objc_msgSend(v4, "appendFormat:", @" indexPath.row: %ld", objc_msgSend(v8, "row"));
  }
  id v9 = (void *)[v4 copy];

  return v9;
}

- (id)task
{
  return self->_task;
}

- (NSString)avatarRecordIdentifier
{
  return self->_avatarRecordIdentifier;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (unint64_t)stickerType
{
  return self->_stickerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_avatarRecordIdentifier, 0);
  objc_storeStrong(&self->_task, 0);
}

@end