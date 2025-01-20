@interface IDSQRParticipantStreams
+ (id)streamWithParticipantID:(id)a3 streamArray:(id)a4 anyParticipant:(BOOL)a5 anyStream:(BOOL)a6;
- (BOOL)anyParticipant;
- (BOOL)anyStream;
- (IDSQRParticipantStreams)initWithParticipantID:(id)a3 streamArray:(id)a4 anyParticipant:(BOOL)a5 anyStream:(BOOL)a6;
- (NSMutableArray)streamArray;
- (NSNumber)participantID;
- (id)description;
@end

@implementation IDSQRParticipantStreams

+ (id)streamWithParticipantID:(id)a3 streamArray:(id)a4 anyParticipant:(BOOL)a5 anyStream:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [IDSQRParticipantStreams alloc];
  v14 = objc_msgSend_initWithParticipantID_streamArray_anyParticipant_anyStream_(v11, v12, (uint64_t)v10, v13, v9, v7, v6);

  return v14;
}

- (IDSQRParticipantStreams)initWithParticipantID:(id)a3 streamArray:(id)a4 anyParticipant:(BOOL)a5 anyStream:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IDSQRParticipantStreams;
  double v13 = [(IDSQRParticipantStreams *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_participantID, a3);
    objc_storeStrong((id *)&v14->_streamArray, a4);
    v14->_anyParticipant = a5;
    v14->_anyStream = a6;
  }

  return v14;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@ (%1d,%1d) %@", v2, self->_participantID, self->_anyParticipant, self->_anyStream, self->_streamArray);
}

- (NSNumber)participantID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableArray)streamArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)anyParticipant
{
  return self->_anyParticipant;
}

- (BOOL)anyStream
{
  return self->_anyStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamArray, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
}

@end