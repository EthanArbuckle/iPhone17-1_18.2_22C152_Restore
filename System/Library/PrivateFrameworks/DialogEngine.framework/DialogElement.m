@interface DialogElement
- (BOOL)isApprovedForGrading;
- (BOOL)printOnly;
- (BOOL)spokenOnly;
- (BOOL)spokenOnlyDefined;
- (NSString)fullPrint;
- (NSString)fullSpeak;
- (NSString)id;
- (NSString)redactedFullPrint;
- (NSString)redactedFullSpeak;
- (NSString)redactedSupportingPrint;
- (NSString)redactedSupportingSpeak;
- (NSString)supportingPrint;
- (NSString)supportingSpeak;
- (NSString)unfilteredFullPrint;
- (NSString)unfilteredFullSpeak;
- (NSString)unfilteredRedactedFullPrint;
- (NSString)unfilteredRedactedFullSpeak;
- (NSString)unfilteredSupportingPrint;
- (NSString)unfilteredSupportingSpeak;
- (void)setFullPrint:(id)a3;
- (void)setFullSpeak:(id)a3;
- (void)setId:(id)a3;
- (void)setIsApprovedForGrading:(BOOL)a3;
- (void)setPrintOnly:(BOOL)a3;
- (void)setRedactedFullPrint:(id)a3;
- (void)setRedactedFullSpeak:(id)a3;
- (void)setRedactedSupportingPrint:(id)a3;
- (void)setRedactedSupportingSpeak:(id)a3;
- (void)setSpokenOnly:(BOOL)a3;
- (void)setSpokenOnlyDefined:(BOOL)a3;
- (void)setSupportingPrint:(id)a3;
- (void)setSupportingSpeak:(id)a3;
- (void)setUnfilteredFullPrint:(id)a3;
- (void)setUnfilteredFullSpeak:(id)a3;
- (void)setUnfilteredRedactedFullPrint:(id)a3;
- (void)setUnfilteredRedactedFullSpeak:(id)a3;
- (void)setUnfilteredSupportingPrint:(id)a3;
- (void)setUnfilteredSupportingSpeak:(id)a3;
@end

@implementation DialogElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfilteredRedactedFullSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredRedactedFullPrint, 0);
  objc_storeStrong((id *)&self->_redactedSupportingSpeak, 0);
  objc_storeStrong((id *)&self->_redactedSupportingPrint, 0);
  objc_storeStrong((id *)&self->_redactedFullSpeak, 0);
  objc_storeStrong((id *)&self->_redactedFullPrint, 0);
  objc_storeStrong((id *)&self->_unfilteredSupportingSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredSupportingPrint, 0);
  objc_storeStrong((id *)&self->_unfilteredFullSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredFullPrint, 0);
  objc_storeStrong((id *)&self->_supportingSpeak, 0);
  objc_storeStrong((id *)&self->_supportingPrint, 0);
  objc_storeStrong((id *)&self->_fullSpeak, 0);
  objc_storeStrong((id *)&self->_fullPrint, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)setIsApprovedForGrading:(BOOL)a3
{
  self->_isApprovedForGrading = a3;
}

- (BOOL)isApprovedForGrading
{
  return self->_isApprovedForGrading;
}

- (void)setSpokenOnlyDefined:(BOOL)a3
{
  self->_spokenOnlyDefined = a3;
}

- (BOOL)spokenOnlyDefined
{
  return self->_spokenOnlyDefined;
}

- (void)setSpokenOnly:(BOOL)a3
{
  self->_spokenOnly = a3;
}

- (BOOL)spokenOnly
{
  return self->_spokenOnly;
}

- (void)setPrintOnly:(BOOL)a3
{
  self->_printOnly = a3;
}

- (BOOL)printOnly
{
  return self->_printOnly;
}

- (void)setUnfilteredRedactedFullSpeak:(id)a3
{
}

- (NSString)unfilteredRedactedFullSpeak
{
  return self->_unfilteredRedactedFullSpeak;
}

- (void)setUnfilteredRedactedFullPrint:(id)a3
{
}

- (NSString)unfilteredRedactedFullPrint
{
  return self->_unfilteredRedactedFullPrint;
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

- (void)setId:(id)a3
{
}

- (NSString)id
{
  return self->_id;
}

@end