@interface StateData
- (BOOL)joinMethodIsBroadcast;
- (NSMutableArray)conferenceDetails;
- (NSMutableArray)joinMethods;
- (NSMutableArray)ranges;
- (NSString)blockTitle;
- (NSString)conferenceTitle;
- (NSString)joinMethodTitle;
- (NSURL)joinMethodURL;
- (StateData)init;
- (_NSRange)endRange;
- (_NSRange)startRange;
- (id)description;
- (unint64_t)state;
- (void)resetToNewSection;
- (void)setBlockTitle:(id)a3;
- (void)setConferenceDetails:(id)a3;
- (void)setConferenceTitle:(id)a3;
- (void)setEndRange:(_NSRange)a3;
- (void)setJoinMethodIsBroadcast:(BOOL)a3;
- (void)setJoinMethodTitle:(id)a3;
- (void)setJoinMethodURL:(id)a3;
- (void)setJoinMethods:(id)a3;
- (void)setRanges:(id)a3;
- (void)setStartRange:(_NSRange)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation StateData

- (StateData)init
{
  v11.receiver = self;
  v11.super_class = (Class)StateData;
  v2 = [(StateData *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    joinMethods = v3->_joinMethods;
    v3->_joinMethods = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    conferenceDetails = v3->_conferenceDetails;
    v3->_conferenceDetails = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    ranges = v3->_ranges;
    v3->_ranges = (NSMutableArray *)v8;
  }
  return v3;
}

- (void)resetToNewSection
{
  self->_state = 0;
}

- (id)description
{
  v16 = NSString;
  unint64_t v15 = [(StateData *)self state];
  v14 = [(StateData *)self blockTitle];
  v13 = [(StateData *)self conferenceTitle];
  v3 = [(StateData *)self joinMethodTitle];
  uint64_t v4 = [(StateData *)self joinMethodURL];
  v18.location = [(StateData *)self startRange];
  v5 = NSStringFromRange(v18);
  v19.location = [(StateData *)self endRange];
  uint64_t v6 = NSStringFromRange(v19);
  v7 = [(StateData *)self joinMethods];
  uint64_t v8 = [(StateData *)self conferenceDetails];
  v9 = [(StateData *)self ranges];
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[StateData joinMethodIsBroadcast](self, "joinMethodIsBroadcast"));
  objc_super v11 = [v16 stringWithFormat:@"ParseData state: %tu, blockTitle: %@, conferenceTitle: %@, joinMethodTitle: %@, joinMethodURL: %@, startRange: %@, endRange: %@, joinMethods: %@, conferenceDetails: %@, ranges: %@, joinMethodIsBroadcast: %@", v15, v14, v13, v3, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)blockTitle
{
  return self->_blockTitle;
}

- (void)setBlockTitle:(id)a3
{
}

- (NSString)conferenceTitle
{
  return self->_conferenceTitle;
}

- (void)setConferenceTitle:(id)a3
{
}

- (NSString)joinMethodTitle
{
  return self->_joinMethodTitle;
}

- (void)setJoinMethodTitle:(id)a3
{
}

- (NSURL)joinMethodURL
{
  return self->_joinMethodURL;
}

- (void)setJoinMethodURL:(id)a3
{
}

- (BOOL)joinMethodIsBroadcast
{
  return self->_joinMethodIsBroadcast;
}

- (void)setJoinMethodIsBroadcast:(BOOL)a3
{
  self->_joinMethodIsBroadcast = a3;
}

- (_NSRange)startRange
{
  NSUInteger length = self->_startRange.length;
  NSUInteger location = self->_startRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStartRange:(_NSRange)a3
{
  self->_startRange = a3;
}

- (_NSRange)endRange
{
  NSUInteger length = self->_endRange.length;
  NSUInteger location = self->_endRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setEndRange:(_NSRange)a3
{
  self->_endRange = a3;
}

- (NSMutableArray)joinMethods
{
  return self->_joinMethods;
}

- (void)setJoinMethods:(id)a3
{
}

- (NSMutableArray)conferenceDetails
{
  return self->_conferenceDetails;
}

- (void)setConferenceDetails:(id)a3
{
}

- (NSMutableArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_conferenceDetails, 0);
  objc_storeStrong((id *)&self->_joinMethods, 0);
  objc_storeStrong((id *)&self->_joinMethodURL, 0);
  objc_storeStrong((id *)&self->_joinMethodTitle, 0);
  objc_storeStrong((id *)&self->_conferenceTitle, 0);

  objc_storeStrong((id *)&self->_blockTitle, 0);
}

@end