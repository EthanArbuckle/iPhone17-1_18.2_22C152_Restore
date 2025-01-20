@interface _CPSearchViewAppearFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnLockScreen;
- (BOOL)isOverApp;
- (BOOL)isUsingLoweredSearchBar;
- (BOOL)readFrom:(id)a3;
- (BOOL)readerTextAvailable;
- (NSString)originatingApp;
- (NSString)preexistingInput;
- (_CPSearchViewAppearFeedback)init;
- (_CPSearchViewAppearFeedback)initWithFacade:(id)a3;
- (int)viewAppearEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setIsOnLockScreen:(BOOL)a3;
- (void)setIsOverApp:(BOOL)a3;
- (void)setIsUsingLoweredSearchBar:(BOOL)a3;
- (void)setOriginatingApp:(id)a3;
- (void)setPreexistingInput:(id)a3;
- (void)setReaderTextAvailable:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setViewAppearEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSearchViewAppearFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingApp, 0);

  objc_storeStrong((id *)&self->_preexistingInput, 0);
}

- (_CPSearchViewAppearFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPSearchViewAppearFeedback;
  v2 = [(_CPSearchViewAppearFeedback *)&v5 init];
  if (v2)
  {
    [(_CPSearchViewAppearFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPSearchViewAppearFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPSearchViewAppearFeedback;
  objc_super v5 = [(_CPSearchViewAppearFeedback *)&v12 init];
  if (v5)
  {
    -[_CPSearchViewAppearFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    -[_CPSearchViewAppearFeedback setViewAppearEvent:](v5, "setViewAppearEvent:", [v4 viewAppearEvent]);
    -[_CPSearchViewAppearFeedback setIsOnLockScreen:](v5, "setIsOnLockScreen:", [v4 isOnLockScreen]);
    -[_CPSearchViewAppearFeedback setIsOverApp:](v5, "setIsOverApp:", [v4 isOverApp]);
    -[_CPSearchViewAppearFeedback setReaderTextAvailable:](v5, "setReaderTextAvailable:", [v4 readerTextAvailable]);
    v6 = [v4 preexistingInput];

    if (v6)
    {
      v7 = [v4 preexistingInput];
      [(_CPSearchViewAppearFeedback *)v5 setPreexistingInput:v7];
    }
    v8 = [v4 originatingApp];

    if (v8)
    {
      v9 = [v4 originatingApp];
      [(_CPSearchViewAppearFeedback *)v5 setOriginatingApp:v9];
    }
    -[_CPSearchViewAppearFeedback setIsUsingLoweredSearchBar:](v5, "setIsUsingLoweredSearchBar:", [v4 isUsingLoweredSearchBar]);
    v10 = v5;
  }

  return v5;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_CPSearchViewAppearFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPSearchViewAppearFeedback *)self viewAppearEvent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPSearchViewAppearFeedback *)self isOnLockScreen]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPSearchViewAppearFeedback *)self isOverApp]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPSearchViewAppearFeedback *)self readerTextAvailable]) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(_CPSearchViewAppearFeedback *)self preexistingInput];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  objc_super v5 = [(_CPSearchViewAppearFeedback *)self originatingApp];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPSearchViewAppearFeedback *)self isUsingLoweredSearchBar]) {
    PBDataWriterWriteBOOLField();
  }
}

- (int)viewAppearEvent
{
  return self->_viewAppearEvent;
}

- (BOOL)isOnLockScreen
{
  return self->_isOnLockScreen;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)readerTextAvailable
{
  return self->_readerTextAvailable;
}

- (NSString)preexistingInput
{
  return self->_preexistingInput;
}

- (NSString)originatingApp
{
  return self->_originatingApp;
}

- (BOOL)isUsingLoweredSearchBar
{
  return self->_isUsingLoweredSearchBar;
}

- (BOOL)isOverApp
{
  return self->_isOverApp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void)setViewAppearEvent:(int)a3
{
  self->_viewAppearEvent = a3;
}

- (void)setIsUsingLoweredSearchBar:(BOOL)a3
{
  self->_isUsingLoweredSearchBar = a3;
}

- (void)setReaderTextAvailable:(BOOL)a3
{
  self->_readerTextAvailable = a3;
}

- (void)setIsOverApp:(BOOL)a3
{
  self->_isOverApp = a3;
}

- (void)setIsOnLockScreen:(BOOL)a3
{
  self->_isOnLockScreen = a3;
}

- (void)setOriginatingApp:(id)a3
{
}

- (void)setPreexistingInput:(id)a3
{
}

- (unint64_t)hash
{
  unint64_t v3 = (2654435761 * self->_viewAppearEvent) ^ (2654435761u * self->_timestamp) ^ (2654435761 * self->_isOnLockScreen) ^ (2654435761 * self->_isOverApp) ^ (2654435761 * self->_readerTextAvailable);
  NSUInteger v4 = [(NSString *)self->_preexistingInput hash];
  return v3 ^ v4 ^ [(NSString *)self->_originatingApp hash] ^ (2654435761 * self->_isUsingLoweredSearchBar);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_17;
  }
  int viewAppearEvent = self->_viewAppearEvent;
  if (viewAppearEvent != [v4 viewAppearEvent]) {
    goto LABEL_17;
  }
  int isOnLockScreen = self->_isOnLockScreen;
  if (isOnLockScreen != [v4 isOnLockScreen]) {
    goto LABEL_17;
  }
  int isOverApp = self->_isOverApp;
  if (isOverApp != [v4 isOverApp]) {
    goto LABEL_17;
  }
  int readerTextAvailable = self->_readerTextAvailable;
  if (readerTextAvailable != [v4 readerTextAvailable]) {
    goto LABEL_17;
  }
  v10 = [(_CPSearchViewAppearFeedback *)self preexistingInput];
  v11 = [v4 preexistingInput];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_CPSearchViewAppearFeedback *)self preexistingInput];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_CPSearchViewAppearFeedback *)self preexistingInput];
    v15 = [v4 preexistingInput];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v10 = [(_CPSearchViewAppearFeedback *)self originatingApp];
  v11 = [v4 originatingApp];
  if ((v10 == 0) != (v11 != 0))
  {
    uint64_t v17 = [(_CPSearchViewAppearFeedback *)self originatingApp];
    if (!v17)
    {

LABEL_20:
      int isUsingLoweredSearchBar = self->_isUsingLoweredSearchBar;
      BOOL v22 = isUsingLoweredSearchBar == [v4 isUsingLoweredSearchBar];
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_CPSearchViewAppearFeedback *)self originatingApp];
    v20 = [v4 originatingApp];
    int v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (BOOL)readFrom:(id)a3
{
  return _CPSearchViewAppearFeedbackReadFrom(self, (uint64_t)a3);
}

@end