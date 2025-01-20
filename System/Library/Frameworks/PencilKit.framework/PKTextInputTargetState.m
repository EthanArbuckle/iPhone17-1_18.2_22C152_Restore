@interface PKTextInputTargetState
- (NSString)description;
- (PKTextInputTargetState)init;
- (__n128)clear;
- (id)copyWithZone:(_NSZone *)a3;
- (void)reportDebugStateDescription:(id)a3;
- (void)setInProgressGestureStrokeUUID:(uint64_t)a1;
@end

@implementation PKTextInputTargetState

- (PKTextInputTargetState)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKTextInputTargetState;
  v2 = [(PKTextInputTargetState *)&v6 init];
  v4 = v2;
  if (v2) {
    [(PKTextInputTargetState *)(uint64_t)v2 clear];
  }
  return v4;
}

- (__n128)clear
{
  if (a1)
  {
    objc_setProperty_nonatomic_copy((id)a1, a2, 0, 48);
    objc_setProperty_nonatomic_copy((id)a1, v3, 0, 56);
    objc_setProperty_nonatomic_copy((id)a1, v4, 0, 16);
    v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    objc_super v6 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    objc_setProperty_nonatomic_copy((id)a1, v7, 0, 40);
    *(void *)(a1 + 64) = 0;
    *(_OWORD *)(a1 + 104) = xmmword_1C482B1D0;
    v8 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    *(void *)(a1 + 72) = 0x7FFFFFFFFFFFFFFFLL;
    __n128 result = (__n128)xmmword_1C482B1D0;
    *(_OWORD *)(a1 + 120) = xmmword_1C482B1D0;
    *(_OWORD *)(a1 + 136) = xmmword_1C482B1D0;
    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 96) = 0;
    *(unsigned char *)(a1 + 8) = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SEL v4 = objc_alloc_init(PKTextInputTargetState);
  uint64_t v6 = (uint64_t)v4;
  if (self)
  {
    uncommittedPendingText = self->_uncommittedPendingText;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uncommittedPendingText = 0;
  if (v4) {
LABEL_3:
  }
    objc_setProperty_nonatomic_copy(v4, v5, uncommittedPendingText, 48);
LABEL_4:
  if (self)
  {
    activePreviewText = self->_activePreviewText;
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  activePreviewText = 0;
  if (v6) {
LABEL_6:
  }
    objc_setProperty_nonatomic_copy((id)v6, v5, activePreviewText, 56);
LABEL_7:
  if (self)
  {
    elementRecognitionIdentifier = self->_elementRecognitionIdentifier;
    if (!v6) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  elementRecognitionIdentifier = 0;
  if (v6) {
LABEL_9:
  }
    objc_setProperty_nonatomic_copy((id)v6, v5, elementRecognitionIdentifier, 16);
LABEL_10:
  if (self)
  {
    -[PKMathResultAttribution setString:](v6, self->_lastQueryItem);
    -[PKMathResultAttribution setDate:](v6, self->_handwritingShot);
    writingSessionIdentifier = self->_writingSessionIdentifier;
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  -[PKMathResultAttribution setString:](v6, 0);
  -[PKMathResultAttribution setDate:](v6, 0);
  writingSessionIdentifier = 0;
  if (v6) {
LABEL_12:
  }
    objc_setProperty_nonatomic_copy((id)v6, v10, writingSessionIdentifier, 40);
LABEL_13:
  if (self)
  {
    int64_t sessionCommitLength = self->_sessionCommitLength;
    if (!v6) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  int64_t sessionCommitLength = 0;
  if (v6) {
LABEL_15:
  }
    *(void *)(v6 + 64) = sessionCommitLength;
LABEL_16:
  if (self)
  {
    int64_t lastCommittedCharacterLevelPosition = self->_lastCommittedCharacterLevelPosition;
    if (!v6) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  int64_t lastCommittedCharacterLevelPosition = 0;
  if (v6) {
LABEL_18:
  }
    *(void *)(v6 + 72) = lastCommittedCharacterLevelPosition;
LABEL_19:
  if (self)
  {
    _NSRange inProgressGestureInitialSelectedRange = self->_inProgressGestureInitialSelectedRange;
    if (!v6) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  _NSRange inProgressGestureInitialSelectedRange = (_NSRange)0;
  if (v6) {
LABEL_21:
  }
    *(_NSRange *)(v6 + 104) = inProgressGestureInitialSelectedRange;
LABEL_22:
  if (self)
  {
    -[PKTextInputTargetState setInProgressGestureStrokeUUID:](v6, self->_inProgressGestureStrokeUUID);
    double lastUpdateTimestamp = self->_lastUpdateTimestamp;
    if (!v6) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  -[PKTextInputTargetState setInProgressGestureStrokeUUID:](v6, 0);
  double lastUpdateTimestamp = 0.0;
  if (v6) {
LABEL_24:
  }
    *(double *)(v6 + 96) = lastUpdateTimestamp;
LABEL_25:
  if (self)
  {
    _NSRange inProgressGestureSelectionRange = self->_inProgressGestureSelectionRange;
    if (!v6) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  _NSRange inProgressGestureSelectionRange = (_NSRange)0;
  if (v6) {
LABEL_27:
  }
    *(_NSRange *)(v6 + 120) = inProgressGestureSelectionRange;
LABEL_28:
  if (self)
  {
    _NSRange inProgressGestureRangeToDelete = self->_inProgressGestureRangeToDelete;
    if (!v6) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  _NSRange inProgressGestureRangeToDelete = (_NSRange)0;
  if (v6) {
LABEL_30:
  }
    *(_NSRange *)(v6 + 136) = inProgressGestureRangeToDelete;
LABEL_31:
  if (self)
  {
    double inProgressGestureStartTimestamp = self->_inProgressGestureStartTimestamp;
    if (!v6) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  double inProgressGestureStartTimestamp = 0.0;
  if (v6) {
LABEL_33:
  }
    *(double *)(v6 + 88) = inProgressGestureStartTimestamp;
LABEL_34:
  if (!self)
  {
    BOOL nextCommitShouldHavePrecedingSeparator = 0;
    if (!v6) {
      return (id)v6;
    }
    goto LABEL_36;
  }
  BOOL nextCommitShouldHavePrecedingSeparator = self->_nextCommitShouldHavePrecedingSeparator;
  if (v6) {
LABEL_36:
  }
    *(unsigned char *)(v6 + 8) = nextCommitShouldHavePrecedingSeparator;
  return (id)v6;
}

- (void)setInProgressGestureStrokeUUID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)PKTextInputTargetState;
  SEL v3 = [(PKTextInputTargetState *)&v7 description];
  SEL v4 = +[PKTextInputDebugStateIntrospector debugStateLineDescriptionForIntrospectable:self];
  v5 = [v3 stringByAppendingFormat:@" %@", v4];

  return (NSString *)v5;
}

- (void)reportDebugStateDescription:(id)a3
{
  SEL v4 = (void (**)(id, __CFString *, void *))a3;
  uncommittedPendingText = self->_uncommittedPendingText;
  v21 = v4;
  if (uncommittedPendingText)
  {
    uint64_t v6 = [NSString stringWithFormat:@"\"%@\"", uncommittedPendingText];
    v21[2](v21, @"uncommittedPendingText", v6);
  }
  else
  {
    v4[2](v4, @"uncommittedPendingText", &stru_1F1FB2C00);
  }
  writingSessionIdentifier = self->_writingSessionIdentifier;
  if (writingSessionIdentifier)
  {
    v8 = [(NSNumber *)writingSessionIdentifier description];
    v21[2](v21, @"writingSessionID", v8);
  }
  else
  {
    v21[2](v21, @"writingSessionID", &stru_1F1FB2C00);
  }
  if (self->_activePreviewText)
  {
    v9 = [NSString stringWithFormat:@"\"%@\"", self->_activePreviewText];
    v21[2](v21, @"activePreviewText", v9);
  }
  else
  {
    v21[2](v21, @"activePreviewText", &stru_1F1FB2C00);
  }
  v10 = [(NSNumber *)self->_elementRecognitionIdentifier description];
  v21[2](v21, @"elementID", v10);

  v11 = [(CHTextInputQueryItem *)self->_lastQueryItem itemStableIdentifier];
  v12 = [v11 description];
  v21[2](v21, @"lastQueryItemID", v12);

  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", self->_sessionCommitLength);
  v21[2](v21, @"sessionCommitLength", v13);

  if (self->_handwritingShot) {
    v14 = @"Yes";
  }
  else {
    v14 = @"No";
  }
  v21[2](v21, @"handwritingShot", v14);
  if (self->_lastCommittedCharacterLevelPosition == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21[2](v21, @"lastCommittedCharacterLevelPosition", @"None");
  }
  else
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", self->_lastCommittedCharacterLevelPosition);
    v21[2](v21, @"lastCommittedCharacterLevelPosition", v15);
  }
  v16.location = self->_inProgressGestureInitialSelectedRange.location;
  if (v16.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21[2](v21, @"inProgressGestureInitialSelectedRange", @"None");
  }
  else
  {
    v16.length = self->_inProgressGestureInitialSelectedRange.length;
    v17 = NSStringFromRange(v16);
    v21[2](v21, @"inProgressGestureInitialSelectedRange", v17);
  }
  inProgressGestureStrokeUUID = self->_inProgressGestureStrokeUUID;
  if (inProgressGestureStrokeUUID)
  {
    v19 = [(NSUUID *)inProgressGestureStrokeUUID description];
    v21[2](v21, @"inProgressGestureStrokeUUID", v19);
  }
  else
  {
    v21[2](v21, @"inProgressGestureStrokeUUID", @"None");
  }
  if (self->_nextCommitShouldHavePrecedingSeparator) {
    v20 = @"Yes";
  }
  else {
    v20 = @"No";
  }
  v21[2](v21, @"nextCommitShouldHavePrecedingSeparator", v20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressGestureStrokeUUID, 0);
  objc_storeStrong((id *)&self->_activePreviewText, 0);
  objc_storeStrong((id *)&self->_uncommittedPendingText, 0);
  objc_storeStrong((id *)&self->_writingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_handwritingShot, 0);
  objc_storeStrong((id *)&self->_lastQueryItem, 0);

  objc_storeStrong((id *)&self->_elementRecognitionIdentifier, 0);
}

@end