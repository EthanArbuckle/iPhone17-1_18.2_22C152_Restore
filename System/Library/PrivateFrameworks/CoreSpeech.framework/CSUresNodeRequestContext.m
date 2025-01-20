@interface CSUresNodeRequestContext
- (BOOL)shouldUpdateMitigationResult;
- (CSAudioRecordContext)recordCtx;
- (CSUresNodeRequestContext)init;
- (NSMutableDictionary)mitigationDecisions;
- (NSString)mhId;
- (NSString)requestId;
- (SLUresMitigatorIpFeats)inputFeats;
- (double)spkrIdAudioProcessedDuration;
- (id)description;
- (unint64_t)lastRCId;
- (void)setInputFeats:(id)a3;
- (void)setLastRCId:(unint64_t)a3;
- (void)setMhId:(id)a3;
- (void)setMitigationDecisions:(id)a3;
- (void)setRecordCtx:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setShouldUpdateMitigationResult:(BOOL)a3;
- (void)setSpkrIdAudioProcessedDuration:(double)a3;
@end

@implementation CSUresNodeRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_storeStrong((id *)&self->_recordCtx, 0);
  objc_storeStrong((id *)&self->_inputFeats, 0);
  objc_storeStrong((id *)&self->_mitigationDecisions, 0);
}

- (void)setSpkrIdAudioProcessedDuration:(double)a3
{
  self->_spkrIdAudioProcessedDuration = a3;
}

- (double)spkrIdAudioProcessedDuration
{
  return self->_spkrIdAudioProcessedDuration;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setLastRCId:(unint64_t)a3
{
  self->_lastRCId = a3;
}

- (unint64_t)lastRCId
{
  return self->_lastRCId;
}

- (void)setMhId:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setRecordCtx:(id)a3
{
}

- (CSAudioRecordContext)recordCtx
{
  return self->_recordCtx;
}

- (void)setInputFeats:(id)a3
{
}

- (SLUresMitigatorIpFeats)inputFeats
{
  return self->_inputFeats;
}

- (void)setShouldUpdateMitigationResult:(BOOL)a3
{
  self->_shouldUpdateMitigationResult = a3;
}

- (BOOL)shouldUpdateMitigationResult
{
  return self->_shouldUpdateMitigationResult;
}

- (void)setMitigationDecisions:(id)a3
{
}

- (NSMutableDictionary)mitigationDecisions
{
  return self->_mitigationDecisions;
}

- (id)description
{
  mhId = self->_mhId;
  v3 = +[CSAudioRecordContext recordTypeString:[(CSAudioRecordContext *)self->_recordCtx type]];
  v4 = +[NSString stringWithFormat:@"MHId %@ recordType %@", mhId, v3];

  return v4;
}

- (CSUresNodeRequestContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSUresNodeRequestContext;
  return [(CSUresNodeRequestContext *)&v3 init];
}

@end