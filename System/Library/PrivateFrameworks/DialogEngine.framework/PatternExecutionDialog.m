@interface PatternExecutionDialog
- (BOOL)isApprovedForGrading;
- (NSNumber)printOnly;
- (NSNumber)spokenOnly;
- (NSString)dialogId;
- (NSString)fullPrint;
- (NSString)fullSpeak;
- (NSString)groupName;
- (NSString)redactedFullPrint;
- (NSString)redactedFullSpeak;
- (NSString)redactedSupportingPrint;
- (NSString)redactedSupportingSpeak;
- (NSString)supportingPrint;
- (NSString)supportingSpeak;
- (NSString)unfilteredFullPrint;
- (NSString)unfilteredFullSpeak;
- (NSString)unfilteredSupportingPrint;
- (NSString)unfilteredSupportingSpeak;
- (void)setDialogId:(id)a3;
- (void)setFullPrint:(id)a3;
- (void)setFullSpeak:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setIsApprovedForGrading:(BOOL)a3;
- (void)setPrintOnly:(id)a3;
- (void)setRedactedFullPrint:(id)a3;
- (void)setRedactedFullSpeak:(id)a3;
- (void)setRedactedSupportingPrint:(id)a3;
- (void)setRedactedSupportingSpeak:(id)a3;
- (void)setSpokenOnly:(id)a3;
- (void)setSupportingPrint:(id)a3;
- (void)setSupportingSpeak:(id)a3;
- (void)setUnfilteredFullPrint:(id)a3;
- (void)setUnfilteredFullSpeak:(id)a3;
- (void)setUnfilteredSupportingPrint:(id)a3;
- (void)setUnfilteredSupportingSpeak:(id)a3;
@end

@implementation PatternExecutionDialog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedSupportingSpeak, 0);
  objc_storeStrong((id *)&self->_redactedSupportingPrint, 0);
  objc_storeStrong((id *)&self->_redactedFullSpeak, 0);
  objc_storeStrong((id *)&self->_redactedFullPrint, 0);
  objc_storeStrong((id *)&self->_unfilteredSupportingSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredSupportingPrint, 0);
  objc_storeStrong((id *)&self->_unfilteredFullSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredFullPrint, 0);
  objc_storeStrong((id *)&self->_spokenOnly, 0);
  objc_storeStrong((id *)&self->_printOnly, 0);
  objc_storeStrong((id *)&self->_supportingSpeak, 0);
  objc_storeStrong((id *)&self->_supportingPrint, 0);
  objc_storeStrong((id *)&self->_fullSpeak, 0);
  objc_storeStrong((id *)&self->_fullPrint, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
}

- (void)setIsApprovedForGrading:(BOOL)a3
{
  self->_isApprovedForGrading = a3;
}

- (BOOL)isApprovedForGrading
{
  return self->_isApprovedForGrading;
}

- (void)setRedactedSupportingSpeak:(id)a3
{
}

- (NSString)redactedSupportingSpeak
{
  return self->_redactedSupportingSpeak;
}

- (void)setRedactedSupportingPrint:(id)a3
{
}

- (NSString)redactedSupportingPrint
{
  return self->_redactedSupportingPrint;
}

- (void)setRedactedFullSpeak:(id)a3
{
}

- (NSString)redactedFullSpeak
{
  return self->_redactedFullSpeak;
}

- (void)setRedactedFullPrint:(id)a3
{
}

- (NSString)redactedFullPrint
{
  return self->_redactedFullPrint;
}

- (void)setUnfilteredSupportingSpeak:(id)a3
{
}

- (NSString)unfilteredSupportingSpeak
{
  return self->_unfilteredSupportingSpeak;
}

- (void)setUnfilteredSupportingPrint:(id)a3
{
}

- (NSString)unfilteredSupportingPrint
{
  return self->_unfilteredSupportingPrint;
}

- (void)setUnfilteredFullSpeak:(id)a3
{
}

- (NSString)unfilteredFullSpeak
{
  return self->_unfilteredFullSpeak;
}

- (void)setUnfilteredFullPrint:(id)a3
{
}

- (NSString)unfilteredFullPrint
{
  return self->_unfilteredFullPrint;
}

- (void)setSpokenOnly:(id)a3
{
}

- (NSNumber)spokenOnly
{
  return self->_spokenOnly;
}

- (void)setPrintOnly:(id)a3
{
}

- (NSNumber)printOnly
{
  return self->_printOnly;
}

- (void)setSupportingSpeak:(id)a3
{
}

- (NSString)supportingSpeak
{
  return self->_supportingSpeak;
}

- (void)setSupportingPrint:(id)a3
{
}

- (NSString)supportingPrint
{
  return self->_supportingPrint;
}

- (void)setFullSpeak:(id)a3
{
}

- (NSString)fullSpeak
{
  return self->_fullSpeak;
}

- (void)setFullPrint:(id)a3
{
}

- (NSString)fullPrint
{
  return self->_fullPrint;
}

- (void)setGroupName:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setDialogId:(id)a3
{
}

- (NSString)dialogId
{
  return self->_dialogId;
}

@end