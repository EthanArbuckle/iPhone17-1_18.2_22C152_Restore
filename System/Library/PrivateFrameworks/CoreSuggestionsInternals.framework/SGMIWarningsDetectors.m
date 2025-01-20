@interface SGMIWarningsDetectors
- (SGMIWarningsDetectionRegexes)attachment;
- (SGMIWarningsDetectionRegexes)followUpOnIncomingMails;
- (SGMIWarningsDetectionRegexes)followUpOnOutgoingMailsAsks;
- (SGMIWarningsDetectionRegexes)followUpOnOutgoingMailsQuestions;
- (SGMIWarningsDetectionRegexes)nickname;
- (SGMIWarningsDetectionRegexes)recipient;
- (SGMIWarningsDetectionRegexes)recipientConservative;
- (SGMIWarningsDetectors)initWithAttachmentDictionary:(id)a3 recipientConservativeDictionary:(id)a4 recipientDictionary:(id)a5 nicknameDictionary:(id)a6 followUpOnOutgoingMailsQuestionsDictionary:(id)a7 followUpOnOutgoingMailsAsksDictionary:(id)a8 followUpOnIncomingMailsDictionary:(id)a9 compiledRegexCache:(id)a10;
- (id)description;
@end

@implementation SGMIWarningsDetectors

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpOnIncomingMails, 0);
  objc_storeStrong((id *)&self->_followUpOnOutgoingMailsAsks, 0);
  objc_storeStrong((id *)&self->_followUpOnOutgoingMailsQuestions, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_recipientConservative, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

- (SGMIWarningsDetectionRegexes)followUpOnIncomingMails
{
  return self->_followUpOnIncomingMails;
}

- (SGMIWarningsDetectionRegexes)followUpOnOutgoingMailsAsks
{
  return self->_followUpOnOutgoingMailsAsks;
}

- (SGMIWarningsDetectionRegexes)followUpOnOutgoingMailsQuestions
{
  return self->_followUpOnOutgoingMailsQuestions;
}

- (SGMIWarningsDetectionRegexes)nickname
{
  return self->_nickname;
}

- (SGMIWarningsDetectionRegexes)recipient
{
  return self->_recipient;
}

- (SGMIWarningsDetectionRegexes)recipientConservative
{
  return self->_recipientConservative;
}

- (SGMIWarningsDetectionRegexes)attachment
{
  return self->_attachment;
}

- (id)description
{
  id v15 = [NSString alloc];
  attachment = self->_attachment;
  if (attachment)
  {
    v17 = [(SGMIWarningsDetectionRegexes *)self->_attachment description];
  }
  else
  {
    v17 = @"(null)";
  }
  recipientConservative = self->_recipientConservative;
  if (recipientConservative)
  {
    v16 = [(SGMIWarningsDetectionRegexes *)self->_recipientConservative description];
  }
  else
  {
    v16 = @"(null)";
  }
  recipient = self->_recipient;
  if (recipient)
  {
    v6 = [(SGMIWarningsDetectionRegexes *)self->_recipient description];
  }
  else
  {
    v6 = @"(null)";
  }
  followUpOnOutgoingMailsQuestions = self->_followUpOnOutgoingMailsQuestions;
  if (followUpOnOutgoingMailsQuestions)
  {
    v8 = [(SGMIWarningsDetectionRegexes *)self->_followUpOnOutgoingMailsQuestions description];
  }
  else
  {
    v8 = @"(null)";
  }
  followUpOnOutgoingMailsAsks = self->_followUpOnOutgoingMailsAsks;
  if (followUpOnOutgoingMailsAsks)
  {
    v10 = [(SGMIWarningsDetectionRegexes *)self->_followUpOnOutgoingMailsAsks description];
  }
  else
  {
    v10 = @"(null)";
  }
  followUpOnIncomingMails = self->_followUpOnIncomingMails;
  if (followUpOnIncomingMails)
  {
    v12 = [(SGMIWarningsDetectionRegexes *)followUpOnIncomingMails description];
    v13 = (void *)[v15 initWithFormat:@"<SGMIWarningsDetectors>\n    attachment:%@\n    recipientConservative:%@\n    recipient:%@\n    followUpOnOutgoingMailsQuestions:%@\n    followUpOnOutgoingMailsAsks:%@\n    followUpOnIncomingMails:%@", v17, v16, v6, v8, v10, v12];

    if (!followUpOnOutgoingMailsAsks) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v13 = (void *)[v15 initWithFormat:@"<SGMIWarningsDetectors>\n    attachment:%@\n    recipientConservative:%@\n    recipient:%@\n    followUpOnOutgoingMailsQuestions:%@\n    followUpOnOutgoingMailsAsks:%@\n    followUpOnIncomingMails:%@", v17, v16, v6, v8, v10, @"(null)"];
  if (followUpOnOutgoingMailsAsks) {
LABEL_18:
  }

LABEL_19:
  if (followUpOnOutgoingMailsQuestions) {

  }
  if (recipient) {
  if (recipientConservative)
  }

  if (attachment) {
  return v13;
  }
}

- (SGMIWarningsDetectors)initWithAttachmentDictionary:(id)a3 recipientConservativeDictionary:(id)a4 recipientDictionary:(id)a5 nicknameDictionary:(id)a6 followUpOnOutgoingMailsQuestionsDictionary:(id)a7 followUpOnOutgoingMailsAsksDictionary:(id)a8 followUpOnIncomingMailsDictionary:(id)a9 compiledRegexCache:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v40.receiver = self;
  v40.super_class = (Class)SGMIWarningsDetectors;
  v24 = [(SGMIWarningsDetectors *)&v40 init];
  if (v24)
  {
    if (v16)
    {
      v25 = [[SGMIWarningsDetectionRegexes alloc] initWithDictionary:v16 compiledRegexCache:v23];
      attachment = v24->_attachment;
      v24->_attachment = v25;
    }
    if (v17)
    {
      v27 = [[SGMIWarningsDetectionRegexes alloc] initWithDictionary:v17 compiledRegexCache:v23];
      recipientConservative = v24->_recipientConservative;
      v24->_recipientConservative = v27;
    }
    if (v18)
    {
      v29 = [[SGMIWarningsDetectionRegexes alloc] initWithDictionary:v18 compiledRegexCache:v23];
      recipient = v24->_recipient;
      v24->_recipient = v29;
    }
    if (v19)
    {
      v31 = [[SGMIWarningsDetectionRegexes alloc] initWithDictionary:v19 compiledRegexCache:v23];
      nickname = v24->_nickname;
      v24->_nickname = v31;
    }
    if (v20)
    {
      v33 = [[SGMIWarningsDetectionRegexes alloc] initWithDictionary:v20 compiledRegexCache:v23];
      followUpOnOutgoingMailsQuestions = v24->_followUpOnOutgoingMailsQuestions;
      v24->_followUpOnOutgoingMailsQuestions = v33;
    }
    if (v21)
    {
      v35 = [[SGMIWarningsDetectionRegexes alloc] initWithDictionary:v21 compiledRegexCache:v23];
      followUpOnOutgoingMailsAsks = v24->_followUpOnOutgoingMailsAsks;
      v24->_followUpOnOutgoingMailsAsks = v35;
    }
    if (v22)
    {
      v37 = [[SGMIWarningsDetectionRegexes alloc] initWithDictionary:v22 compiledRegexCache:v23];
      followUpOnIncomingMails = v24->_followUpOnIncomingMails;
      v24->_followUpOnIncomingMails = v37;
    }
  }

  return v24;
}

@end