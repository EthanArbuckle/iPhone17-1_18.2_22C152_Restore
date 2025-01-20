@interface SNBoxRecordingInfo
@end

@implementation SNBoxRecordingInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);

  objc_storeStrong((id *)&self->_boxName, 0);
}

@end