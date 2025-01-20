@interface CATResult
- (NSArray)captionPrint;
- (NSArray)captionSpeak;
- (NSArray)dialogId;
- (NSArray)isApprovedForGrading;
- (NSArray)print;
- (NSArray)printOnly;
- (NSArray)redactedCaptionPrint;
- (NSArray)redactedCaptionSpeak;
- (NSArray)redactedPrint;
- (NSArray)redactedSpeak;
- (NSArray)speak;
- (NSArray)spokenOnly;
- (NSArray)spokenOnlyDefined;
- (NSArray)unfilteredCaptionPrint;
- (NSArray)unfilteredCaptionSpeak;
- (NSArray)unfilteredPrint;
- (NSArray)unfilteredSpeak;
- (NSData)visualResponse;
- (NSDictionary)meta;
- (NSDictionary)visualParameters;
- (NSString)catId;
- (NSString)visualId;
- (void)setCaptionPrint:(id)a3;
- (void)setCaptionSpeak:(id)a3;
- (void)setCatId:(id)a3;
- (void)setDialogId:(id)a3;
- (void)setIsApprovedForGrading:(id)a3;
- (void)setMeta:(id)a3;
- (void)setPrint:(id)a3;
- (void)setPrintOnly:(id)a3;
- (void)setRedactedCaptionPrint:(id)a3;
- (void)setRedactedCaptionSpeak:(id)a3;
- (void)setRedactedPrint:(id)a3;
- (void)setRedactedSpeak:(id)a3;
- (void)setSpeak:(id)a3;
- (void)setSpokenOnly:(id)a3;
- (void)setSpokenOnlyDefined:(id)a3;
- (void)setUnfilteredCaptionPrint:(id)a3;
- (void)setUnfilteredCaptionSpeak:(id)a3;
- (void)setUnfilteredPrint:(id)a3;
- (void)setUnfilteredSpeak:(id)a3;
- (void)setVisualId:(id)a3;
- (void)setVisualParameters:(id)a3;
- (void)setVisualResponse:(id)a3;
@end

@implementation CATResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedCaptionPrint, 0);
  objc_storeStrong((id *)&self->_redactedCaptionSpeak, 0);
  objc_storeStrong((id *)&self->_redactedPrint, 0);
  objc_storeStrong((id *)&self->_redactedSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredCaptionPrint, 0);
  objc_storeStrong((id *)&self->_unfilteredCaptionSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredPrint, 0);
  objc_storeStrong((id *)&self->_unfilteredSpeak, 0);
  objc_storeStrong((id *)&self->_visualResponse, 0);
  objc_storeStrong((id *)&self->_visualParameters, 0);
  objc_storeStrong((id *)&self->_visualId, 0);
  objc_storeStrong((id *)&self->_isApprovedForGrading, 0);
  objc_storeStrong((id *)&self->_spokenOnlyDefined, 0);
  objc_storeStrong((id *)&self->_spokenOnly, 0);
  objc_storeStrong((id *)&self->_printOnly, 0);
  objc_storeStrong((id *)&self->_captionPrint, 0);
  objc_storeStrong((id *)&self->_captionSpeak, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_print, 0);
  objc_storeStrong((id *)&self->_speak, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_catId, 0);
}

- (void)setRedactedCaptionPrint:(id)a3
{
}

- (NSArray)redactedCaptionPrint
{
  return self->_redactedCaptionPrint;
}

- (void)setRedactedCaptionSpeak:(id)a3
{
}

- (NSArray)redactedCaptionSpeak
{
  return self->_redactedCaptionSpeak;
}

- (void)setRedactedPrint:(id)a3
{
}

- (NSArray)redactedPrint
{
  return self->_redactedPrint;
}

- (void)setRedactedSpeak:(id)a3
{
}

- (NSArray)redactedSpeak
{
  return self->_redactedSpeak;
}

- (void)setUnfilteredCaptionPrint:(id)a3
{
}

- (NSArray)unfilteredCaptionPrint
{
  return self->_unfilteredCaptionPrint;
}

- (void)setUnfilteredCaptionSpeak:(id)a3
{
}

- (NSArray)unfilteredCaptionSpeak
{
  return self->_unfilteredCaptionSpeak;
}

- (void)setUnfilteredPrint:(id)a3
{
}

- (NSArray)unfilteredPrint
{
  return self->_unfilteredPrint;
}

- (void)setUnfilteredSpeak:(id)a3
{
}

- (NSArray)unfilteredSpeak
{
  return self->_unfilteredSpeak;
}

- (void)setVisualResponse:(id)a3
{
}

- (NSData)visualResponse
{
  return self->_visualResponse;
}

- (void)setVisualParameters:(id)a3
{
}

- (NSDictionary)visualParameters
{
  return self->_visualParameters;
}

- (void)setVisualId:(id)a3
{
}

- (NSString)visualId
{
  return self->_visualId;
}

- (void)setIsApprovedForGrading:(id)a3
{
}

- (NSArray)isApprovedForGrading
{
  return self->_isApprovedForGrading;
}

- (void)setSpokenOnlyDefined:(id)a3
{
}

- (NSArray)spokenOnlyDefined
{
  return self->_spokenOnlyDefined;
}

- (void)setSpokenOnly:(id)a3
{
}

- (NSArray)spokenOnly
{
  return self->_spokenOnly;
}

- (void)setPrintOnly:(id)a3
{
}

- (NSArray)printOnly
{
  return self->_printOnly;
}

- (void)setCaptionPrint:(id)a3
{
}

- (NSArray)captionPrint
{
  return self->_captionPrint;
}

- (void)setCaptionSpeak:(id)a3
{
}

- (NSArray)captionSpeak
{
  return self->_captionSpeak;
}

- (void)setDialogId:(id)a3
{
}

- (NSArray)dialogId
{
  return self->_dialogId;
}

- (void)setPrint:(id)a3
{
}

- (NSArray)print
{
  return self->_print;
}

- (void)setSpeak:(id)a3
{
}

- (NSArray)speak
{
  return self->_speak;
}

- (void)setMeta:(id)a3
{
}

- (NSDictionary)meta
{
  return self->_meta;
}

- (void)setCatId:(id)a3
{
}

- (NSString)catId
{
  return self->_catId;
}

@end