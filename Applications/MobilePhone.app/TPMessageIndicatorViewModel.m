@interface TPMessageIndicatorViewModel
- (id)initWithMessage:(id)a3;
@end

@implementation TPMessageIndicatorViewModel

- (id)initWithMessage:(id)a3
{
  id v4 = a3;
  [v4 duration];
  double v6 = v5;
  v7 = [v4 identifier];
  v8 = [v7 stringValue];
  v9 = [v4 dataURL];
  v10 = [v4 thumbnailURL];
  id v11 = [v4 isRead];
  id v12 = [v4 isSensitive];
  id v13 = [v4 messageType];

  v14 = [(TPMessageIndicatorViewModel *)self initWithDuration:v8 identifier:v9 mediaURL:v10 thumbnailURL:v11 isRead:v12 isSensitive:v13 == (id)2 isVideo:v6 fromHandle:0];
  return v14;
}

@end