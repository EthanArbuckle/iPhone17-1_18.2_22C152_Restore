@interface CARMuteOptionsMode
+ (id)allModes;
+ (id)modeWithFullTitle:(id)a3 footer:(id)a4 muteType:(unint64_t)a5 announceType:(int64_t)a6;
- (CARMuteOptionsMode)initWithFullTitle:(id)a3 footer:(id)a4 muteType:(unint64_t)a5 announceType:(int64_t)a6;
- (NSString)footer;
- (NSString)fullTitle;
- (int64_t)announceType;
- (unint64_t)muteType;
@end

@implementation CARMuteOptionsMode

+ (id)modeWithFullTitle:(id)a3 footer:(id)a4 muteType:(unint64_t)a5 announceType:(int64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = [[CARMuteOptionsMode alloc] initWithFullTitle:v10 footer:v9 muteType:a5 announceType:a6];

  return v11;
}

- (CARMuteOptionsMode)initWithFullTitle:(id)a3 footer:(id)a4 muteType:(unint64_t)a5 announceType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CARMuteOptionsMode;
  v13 = [(CARMuteOptionsMode *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fullTitle, a3);
    objc_storeStrong((id *)&v14->_footer, a4);
    v14->_muteType = a5;
    v14->_announceType = a6;
  }

  return v14;
}

+ (id)allModes
{
  if (qword_1000B08A0 != -1) {
    dispatch_once(&qword_1000B08A0, &stru_100092670);
  }
  v2 = (void *)qword_1000B08A8;

  return v2;
}

- (NSString)fullTitle
{
  return self->_fullTitle;
}

- (NSString)footer
{
  return self->_footer;
}

- (unint64_t)muteType
{
  return self->_muteType;
}

- (int64_t)announceType
{
  return self->_announceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);

  objc_storeStrong((id *)&self->_fullTitle, 0);
}

@end