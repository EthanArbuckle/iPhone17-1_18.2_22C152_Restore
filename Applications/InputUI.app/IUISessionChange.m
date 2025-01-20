@interface IUISessionChange
+ (BOOL)supportsSecureCoding;
- (BOOL)isBeginningSession;
- (BOOL)isEndingSession;
- (IUISessionChange)initWithCoder:(id)a3;
- (NSUUID)beginSessionID;
- (NSUUID)endSessionID;
- (RTIDocumentState)beginSessionDocumentState;
- (RTIDocumentTraits)beginSessionDocumentTraits;
- (RTISessionOptions)options;
- (id)description;
- (id)initBeginSession:(BOOL)a3 withID:(id)a4 documentTraits:(id)a5 documentState:(id)a6 andEndSessionWithID:(id)a7 options:(id)a8;
- (id)initBeginSessionWithID:(id)a3 documentTraits:(id)a4 documentState:(id)a5 options:(id)a6;
- (id)initEndSessionWithID:(id)a3 andBeginPlaceholderSessionWithID:(id)a4 documentTraits:(id)a5 documentState:(id)a6 options:(id)a7;
- (id)initEndSessionWithID:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IUISessionChange

- (id)initBeginSession:(BOOL)a3 withID:(id)a4 documentTraits:(id)a5 documentState:(id)a6 andEndSessionWithID:(id)a7 options:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)IUISessionChange;
  v19 = [(IUISessionChange *)&v32 init];
  v20 = v19;
  if (v19)
  {
    v19->_isBeginningSession = a3;
    v21 = (NSUUID *)[v14 copy];
    beginSessionID = v20->_beginSessionID;
    v20->_beginSessionID = v21;

    v23 = (RTIDocumentTraits *)[v15 copy];
    beginSessionDocumentTraits = v20->_beginSessionDocumentTraits;
    v20->_beginSessionDocumentTraits = v23;

    v25 = (RTIDocumentState *)[v16 copy];
    beginSessionDocumentState = v20->_beginSessionDocumentState;
    v20->_beginSessionDocumentState = v25;

    v27 = (NSUUID *)[v17 copy];
    endSessionID = v20->_endSessionID;
    v20->_endSessionID = v27;

    v29 = (RTISessionOptions *)[v18 copy];
    options = v20->_options;
    v20->_options = v29;
  }
  return v20;
}

- (id)initBeginSessionWithID:(id)a3 documentTraits:(id)a4 documentState:(id)a5 options:(id)a6
{
  return [(IUISessionChange *)self initBeginSession:1 withID:a3 documentTraits:a4 documentState:a5 andEndSessionWithID:0 options:a6];
}

- (id)initEndSessionWithID:(id)a3 options:(id)a4
{
  return [(IUISessionChange *)self initBeginSession:0 withID:0 documentTraits:0 documentState:0 andEndSessionWithID:a3 options:a4];
}

- (id)initEndSessionWithID:(id)a3 andBeginPlaceholderSessionWithID:(id)a4 documentTraits:(id)a5 documentState:(id)a6 options:(id)a7
{
  return [(IUISessionChange *)self initBeginSession:1 withID:a4 documentTraits:a5 documentState:a6 andEndSessionWithID:a3 options:a7];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = (void *)v4;
  if (self->_isBeginningSession) {
    v6 = "yes";
  }
  else {
    v6 = "no";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; begin:%s; beginID:%@; endID:%@>",
    v4,
    self,
    v6,
    self->_beginSessionID,
  v7 = self->_endSessionID);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isBeginningSession = self->_isBeginningSession;
  id v5 = a3;
  [v5 encodeBool:isBeginningSession forKey:@"isBeginningSession"];
  [v5 encodeObject:self->_beginSessionID forKey:@"beginSessionID"];
  [v5 encodeObject:self->_beginSessionDocumentTraits forKey:@"documentTraits"];
  [v5 encodeObject:self->_beginSessionDocumentState forKey:@"documentState"];
  [v5 encodeObject:self->_endSessionID forKey:@"endSessionID"];
  [v5 encodeObject:self->_options forKey:@"options"];
}

- (IUISessionChange)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeBoolForKey:@"isBeginningSession"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beginSessionID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentTraits"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentState"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endSessionID"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];

  v11 = [(IUISessionChange *)self initBeginSession:v5 withID:v6 documentTraits:v7 documentState:v8 andEndSessionWithID:v9 options:v10];
  return v11;
}

- (BOOL)isEndingSession
{
  return self->_endSessionID != 0;
}

- (BOOL)isBeginningSession
{
  return self->_isBeginningSession;
}

- (NSUUID)endSessionID
{
  return self->_endSessionID;
}

- (NSUUID)beginSessionID
{
  return self->_beginSessionID;
}

- (RTIDocumentTraits)beginSessionDocumentTraits
{
  return self->_beginSessionDocumentTraits;
}

- (RTIDocumentState)beginSessionDocumentState
{
  return self->_beginSessionDocumentState;
}

- (RTISessionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_beginSessionDocumentState, 0);
  objc_storeStrong((id *)&self->_beginSessionDocumentTraits, 0);
  objc_storeStrong((id *)&self->_beginSessionID, 0);

  objc_storeStrong((id *)&self->_endSessionID, 0);
}

@end