@interface ATXCandidateRelevanceModelPBEvaluationMetrics
- (BOOL)hasProdShadowEvaluationMRR;
- (BOOL)hasProdShadowEvaluationNumberOfDaysWithSessions;
- (BOOL)hasProdShadowEvaluationNumberOfSessions;
- (BOOL)hasProdShadowEvaluationNumberOfSessionsWithPredictions;
- (BOOL)hasProdShadowEvaluationSuccessAt1;
- (BOOL)hasProdShadowEvaluationSuccessAt2;
- (BOOL)hasProdShadowEvaluationSuccessAt4;
- (BOOL)hasProdShadowEvaluationSuccessAt8;
- (BOOL)hasProdUIEvaluationMRR;
- (BOOL)hasProdUIEvaluationNumberOfDaysWithSessions;
- (BOOL)hasProdUIEvaluationNumberOfSessions;
- (BOOL)hasProdUIEvaluationNumberOfSessionsWithPredictions;
- (BOOL)hasProdUIEvaluationSuccessAt1;
- (BOOL)hasProdUIEvaluationSuccessAt2;
- (BOOL)hasProdUIEvaluationSuccessAt4;
- (BOOL)hasProdUIEvaluationSuccessAt8;
- (BOOL)hasShadowEvaluationMRR;
- (BOOL)hasShadowEvaluationNumberOfDaysWithSessions;
- (BOOL)hasShadowEvaluationNumberOfSessions;
- (BOOL)hasShadowEvaluationNumberOfSessionsWithPredictions;
- (BOOL)hasShadowEvaluationSuccessAt1;
- (BOOL)hasShadowEvaluationSuccessAt2;
- (BOOL)hasShadowEvaluationSuccessAt4;
- (BOOL)hasShadowEvaluationSuccessAt8;
- (BOOL)hasUiEvaluationMRR;
- (BOOL)hasUiEvaluationNumberOfDaysWithSessions;
- (BOOL)hasUiEvaluationNumberOfSessions;
- (BOOL)hasUiEvaluationNumberOfSessionsWithPredictions;
- (BOOL)hasUiEvaluationSuccessAt1;
- (BOOL)hasUiEvaluationSuccessAt2;
- (BOOL)hasUiEvaluationSuccessAt4;
- (BOOL)hasUiEvaluationSuccessAt8;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)prodShadowEvaluationMRR;
- (float)prodShadowEvaluationSuccessAt1;
- (float)prodShadowEvaluationSuccessAt2;
- (float)prodShadowEvaluationSuccessAt4;
- (float)prodShadowEvaluationSuccessAt8;
- (float)prodUIEvaluationMRR;
- (float)prodUIEvaluationSuccessAt1;
- (float)prodUIEvaluationSuccessAt2;
- (float)prodUIEvaluationSuccessAt4;
- (float)prodUIEvaluationSuccessAt8;
- (float)shadowEvaluationMRR;
- (float)shadowEvaluationSuccessAt1;
- (float)shadowEvaluationSuccessAt2;
- (float)shadowEvaluationSuccessAt4;
- (float)shadowEvaluationSuccessAt8;
- (float)uiEvaluationMRR;
- (float)uiEvaluationSuccessAt1;
- (float)uiEvaluationSuccessAt2;
- (float)uiEvaluationSuccessAt4;
- (float)uiEvaluationSuccessAt8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)prodShadowEvaluationNumberOfDaysWithSessions;
- (unsigned)prodShadowEvaluationNumberOfSessions;
- (unsigned)prodShadowEvaluationNumberOfSessionsWithPredictions;
- (unsigned)prodUIEvaluationNumberOfDaysWithSessions;
- (unsigned)prodUIEvaluationNumberOfSessions;
- (unsigned)prodUIEvaluationNumberOfSessionsWithPredictions;
- (unsigned)shadowEvaluationNumberOfDaysWithSessions;
- (unsigned)shadowEvaluationNumberOfSessions;
- (unsigned)shadowEvaluationNumberOfSessionsWithPredictions;
- (unsigned)uiEvaluationNumberOfDaysWithSessions;
- (unsigned)uiEvaluationNumberOfSessions;
- (unsigned)uiEvaluationNumberOfSessionsWithPredictions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasProdShadowEvaluationMRR:(BOOL)a3;
- (void)setHasProdShadowEvaluationNumberOfDaysWithSessions:(BOOL)a3;
- (void)setHasProdShadowEvaluationNumberOfSessions:(BOOL)a3;
- (void)setHasProdShadowEvaluationNumberOfSessionsWithPredictions:(BOOL)a3;
- (void)setHasProdShadowEvaluationSuccessAt1:(BOOL)a3;
- (void)setHasProdShadowEvaluationSuccessAt2:(BOOL)a3;
- (void)setHasProdShadowEvaluationSuccessAt4:(BOOL)a3;
- (void)setHasProdShadowEvaluationSuccessAt8:(BOOL)a3;
- (void)setHasProdUIEvaluationMRR:(BOOL)a3;
- (void)setHasProdUIEvaluationNumberOfDaysWithSessions:(BOOL)a3;
- (void)setHasProdUIEvaluationNumberOfSessions:(BOOL)a3;
- (void)setHasProdUIEvaluationNumberOfSessionsWithPredictions:(BOOL)a3;
- (void)setHasProdUIEvaluationSuccessAt1:(BOOL)a3;
- (void)setHasProdUIEvaluationSuccessAt2:(BOOL)a3;
- (void)setHasProdUIEvaluationSuccessAt4:(BOOL)a3;
- (void)setHasProdUIEvaluationSuccessAt8:(BOOL)a3;
- (void)setHasShadowEvaluationMRR:(BOOL)a3;
- (void)setHasShadowEvaluationNumberOfDaysWithSessions:(BOOL)a3;
- (void)setHasShadowEvaluationNumberOfSessions:(BOOL)a3;
- (void)setHasShadowEvaluationNumberOfSessionsWithPredictions:(BOOL)a3;
- (void)setHasShadowEvaluationSuccessAt1:(BOOL)a3;
- (void)setHasShadowEvaluationSuccessAt2:(BOOL)a3;
- (void)setHasShadowEvaluationSuccessAt4:(BOOL)a3;
- (void)setHasShadowEvaluationSuccessAt8:(BOOL)a3;
- (void)setHasUiEvaluationMRR:(BOOL)a3;
- (void)setHasUiEvaluationNumberOfDaysWithSessions:(BOOL)a3;
- (void)setHasUiEvaluationNumberOfSessions:(BOOL)a3;
- (void)setHasUiEvaluationNumberOfSessionsWithPredictions:(BOOL)a3;
- (void)setHasUiEvaluationSuccessAt1:(BOOL)a3;
- (void)setHasUiEvaluationSuccessAt2:(BOOL)a3;
- (void)setHasUiEvaluationSuccessAt4:(BOOL)a3;
- (void)setHasUiEvaluationSuccessAt8:(BOOL)a3;
- (void)setProdShadowEvaluationMRR:(float)a3;
- (void)setProdShadowEvaluationNumberOfDaysWithSessions:(unsigned int)a3;
- (void)setProdShadowEvaluationNumberOfSessions:(unsigned int)a3;
- (void)setProdShadowEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3;
- (void)setProdShadowEvaluationSuccessAt1:(float)a3;
- (void)setProdShadowEvaluationSuccessAt2:(float)a3;
- (void)setProdShadowEvaluationSuccessAt4:(float)a3;
- (void)setProdShadowEvaluationSuccessAt8:(float)a3;
- (void)setProdUIEvaluationMRR:(float)a3;
- (void)setProdUIEvaluationNumberOfDaysWithSessions:(unsigned int)a3;
- (void)setProdUIEvaluationNumberOfSessions:(unsigned int)a3;
- (void)setProdUIEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3;
- (void)setProdUIEvaluationSuccessAt1:(float)a3;
- (void)setProdUIEvaluationSuccessAt2:(float)a3;
- (void)setProdUIEvaluationSuccessAt4:(float)a3;
- (void)setProdUIEvaluationSuccessAt8:(float)a3;
- (void)setShadowEvaluationMRR:(float)a3;
- (void)setShadowEvaluationNumberOfDaysWithSessions:(unsigned int)a3;
- (void)setShadowEvaluationNumberOfSessions:(unsigned int)a3;
- (void)setShadowEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3;
- (void)setShadowEvaluationSuccessAt1:(float)a3;
- (void)setShadowEvaluationSuccessAt2:(float)a3;
- (void)setShadowEvaluationSuccessAt4:(float)a3;
- (void)setShadowEvaluationSuccessAt8:(float)a3;
- (void)setUiEvaluationMRR:(float)a3;
- (void)setUiEvaluationNumberOfDaysWithSessions:(unsigned int)a3;
- (void)setUiEvaluationNumberOfSessions:(unsigned int)a3;
- (void)setUiEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3;
- (void)setUiEvaluationSuccessAt1:(float)a3;
- (void)setUiEvaluationSuccessAt2:(float)a3;
- (void)setUiEvaluationSuccessAt4:(float)a3;
- (void)setUiEvaluationSuccessAt8:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXCandidateRelevanceModelPBEvaluationMetrics

- (void)setUiEvaluationSuccessAt1:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_uiEvaluationSuccessAt1 = a3;
}

- (void)setHasUiEvaluationSuccessAt1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasUiEvaluationSuccessAt1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setUiEvaluationSuccessAt2:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_uiEvaluationSuccessAt2 = a3;
}

- (void)setHasUiEvaluationSuccessAt2:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasUiEvaluationSuccessAt2
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setUiEvaluationSuccessAt4:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_uiEvaluationSuccessAt4 = a3;
}

- (void)setHasUiEvaluationSuccessAt4:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasUiEvaluationSuccessAt4
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setUiEvaluationSuccessAt8:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_uiEvaluationSuccessAt8 = a3;
}

- (void)setHasUiEvaluationSuccessAt8:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = 0x80000000;
  }
  else {
    unsigned int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(v3 & 0x80000000 | *(_DWORD *)&self->_has & 0x7FFFFFFF);
}

- (BOOL)hasUiEvaluationSuccessAt8
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setUiEvaluationMRR:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_uiEvaluationMRR = a3;
}

- (void)setHasUiEvaluationMRR:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasUiEvaluationMRR
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setUiEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_uiEvaluationNumberOfSessionsWithPredictions = a3;
}

- (void)setHasUiEvaluationNumberOfSessionsWithPredictions:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasUiEvaluationNumberOfSessionsWithPredictions
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setUiEvaluationNumberOfSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_uiEvaluationNumberOfSessions = a3;
}

- (void)setHasUiEvaluationNumberOfSessions:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasUiEvaluationNumberOfSessions
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setUiEvaluationNumberOfDaysWithSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_uiEvaluationNumberOfDaysWithSessions = a3;
}

- (void)setHasUiEvaluationNumberOfDaysWithSessions:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasUiEvaluationNumberOfDaysWithSessions
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setShadowEvaluationSuccessAt1:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_shadowEvaluationSuccessAt1 = a3;
}

- (void)setHasShadowEvaluationSuccessAt1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasShadowEvaluationSuccessAt1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setShadowEvaluationSuccessAt2:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_shadowEvaluationSuccessAt2 = a3;
}

- (void)setHasShadowEvaluationSuccessAt2:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasShadowEvaluationSuccessAt2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setShadowEvaluationSuccessAt4:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_shadowEvaluationSuccessAt4 = a3;
}

- (void)setHasShadowEvaluationSuccessAt4:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasShadowEvaluationSuccessAt4
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setShadowEvaluationSuccessAt8:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_shadowEvaluationSuccessAt8 = a3;
}

- (void)setHasShadowEvaluationSuccessAt8:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasShadowEvaluationSuccessAt8
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setShadowEvaluationMRR:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_shadowEvaluationMRR = a3;
}

- (void)setHasShadowEvaluationMRR:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasShadowEvaluationMRR
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setShadowEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_shadowEvaluationNumberOfSessionsWithPredictions = a3;
}

- (void)setHasShadowEvaluationNumberOfSessionsWithPredictions:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasShadowEvaluationNumberOfSessionsWithPredictions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setShadowEvaluationNumberOfSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_shadowEvaluationNumberOfSessions = a3;
}

- (void)setHasShadowEvaluationNumberOfSessions:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasShadowEvaluationNumberOfSessions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setShadowEvaluationNumberOfDaysWithSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_shadowEvaluationNumberOfDaysWithSessions = a3;
}

- (void)setHasShadowEvaluationNumberOfDaysWithSessions:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasShadowEvaluationNumberOfDaysWithSessions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setProdUIEvaluationSuccessAt1:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_prodUIEvaluationSuccessAt1 = a3;
}

- (void)setHasProdUIEvaluationSuccessAt1:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasProdUIEvaluationSuccessAt1
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setProdUIEvaluationSuccessAt2:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_prodUIEvaluationSuccessAt2 = a3;
}

- (void)setHasProdUIEvaluationSuccessAt2:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasProdUIEvaluationSuccessAt2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setProdUIEvaluationSuccessAt4:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_prodUIEvaluationSuccessAt4 = a3;
}

- (void)setHasProdUIEvaluationSuccessAt4:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasProdUIEvaluationSuccessAt4
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setProdUIEvaluationSuccessAt8:(float)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_prodUIEvaluationSuccessAt8 = a3;
}

- (void)setHasProdUIEvaluationSuccessAt8:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasProdUIEvaluationSuccessAt8
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setProdUIEvaluationMRR:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_prodUIEvaluationMRR = a3;
}

- (void)setHasProdUIEvaluationMRR:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasProdUIEvaluationMRR
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setProdUIEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_prodUIEvaluationNumberOfSessionsWithPredictions = a3;
}

- (void)setHasProdUIEvaluationNumberOfSessionsWithPredictions:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasProdUIEvaluationNumberOfSessionsWithPredictions
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setProdUIEvaluationNumberOfSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_prodUIEvaluationNumberOfSessions = a3;
}

- (void)setHasProdUIEvaluationNumberOfSessions:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasProdUIEvaluationNumberOfSessions
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setProdUIEvaluationNumberOfDaysWithSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_prodUIEvaluationNumberOfDaysWithSessions = a3;
}

- (void)setHasProdUIEvaluationNumberOfDaysWithSessions:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasProdUIEvaluationNumberOfDaysWithSessions
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setProdShadowEvaluationSuccessAt1:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_prodShadowEvaluationSuccessAt1 = a3;
}

- (void)setHasProdShadowEvaluationSuccessAt1:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasProdShadowEvaluationSuccessAt1
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setProdShadowEvaluationSuccessAt2:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_prodShadowEvaluationSuccessAt2 = a3;
}

- (void)setHasProdShadowEvaluationSuccessAt2:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasProdShadowEvaluationSuccessAt2
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setProdShadowEvaluationSuccessAt4:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_prodShadowEvaluationSuccessAt4 = a3;
}

- (void)setHasProdShadowEvaluationSuccessAt4:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasProdShadowEvaluationSuccessAt4
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setProdShadowEvaluationSuccessAt8:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_prodShadowEvaluationSuccessAt8 = a3;
}

- (void)setHasProdShadowEvaluationSuccessAt8:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasProdShadowEvaluationSuccessAt8
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setProdShadowEvaluationMRR:(float)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_prodShadowEvaluationMRR = a3;
}

- (void)setHasProdShadowEvaluationMRR:(BOOL)a3
{
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasProdShadowEvaluationMRR
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setProdShadowEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_prodShadowEvaluationNumberOfSessionsWithPredictions = a3;
}

- (void)setHasProdShadowEvaluationNumberOfSessionsWithPredictions:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasProdShadowEvaluationNumberOfSessionsWithPredictions
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setProdShadowEvaluationNumberOfSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_prodShadowEvaluationNumberOfSessions = a3;
}

- (void)setHasProdShadowEvaluationNumberOfSessions:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasProdShadowEvaluationNumberOfSessions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProdShadowEvaluationNumberOfDaysWithSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_prodShadowEvaluationNumberOfDaysWithSessions = a3;
}

- (void)setHasProdShadowEvaluationNumberOfDaysWithSessions:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasProdShadowEvaluationNumberOfDaysWithSessions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXCandidateRelevanceModelPBEvaluationMetrics;
  v4 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)&v8 description];
  v5 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    *(float *)&double v4 = self->_uiEvaluationSuccessAt1;
    v9 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v9 forKey:@"uiEvaluationSuccessAt1"];

    $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_uiEvaluationSuccessAt2;
  v10 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v10 forKey:@"uiEvaluationSuccessAt2"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(float *)&double v4 = self->_uiEvaluationSuccessAt4;
  v11 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v11 forKey:@"uiEvaluationSuccessAt4"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(float *)&double v4 = self->_uiEvaluationSuccessAt8;
  v12 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v12 forKey:@"uiEvaluationSuccessAt8"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(float *)&double v4 = self->_uiEvaluationMRR;
  v13 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v13 forKey:@"uiEvaluationMRR"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  v14 = [NSNumber numberWithUnsignedInt:self->_uiEvaluationNumberOfSessionsWithPredictions];
  [v3 setObject:v14 forKey:@"uiEvaluationNumberOfSessionsWithPredictions"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  v15 = [NSNumber numberWithUnsignedInt:self->_uiEvaluationNumberOfSessions];
  [v3 setObject:v15 forKey:@"uiEvaluationNumberOfSessions"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  v16 = [NSNumber numberWithUnsignedInt:self->_uiEvaluationNumberOfDaysWithSessions];
  [v3 setObject:v16 forKey:@"uiEvaluationNumberOfDaysWithSessions"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(float *)&double v4 = self->_shadowEvaluationSuccessAt1;
  v17 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v17 forKey:@"shadowEvaluationSuccessAt1"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(float *)&double v4 = self->_shadowEvaluationSuccessAt2;
  v18 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v18 forKey:@"shadowEvaluationSuccessAt2"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(float *)&double v4 = self->_shadowEvaluationSuccessAt4;
  v19 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v19 forKey:@"shadowEvaluationSuccessAt4"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(float *)&double v4 = self->_shadowEvaluationSuccessAt8;
  v20 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v20 forKey:@"shadowEvaluationSuccessAt8"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(float *)&double v4 = self->_shadowEvaluationMRR;
  v21 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v21 forKey:@"shadowEvaluationMRR"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_49;
  }
LABEL_48:
  v22 = [NSNumber numberWithUnsignedInt:self->_shadowEvaluationNumberOfSessionsWithPredictions];
  [v3 setObject:v22 forKey:@"shadowEvaluationNumberOfSessionsWithPredictions"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_50;
  }
LABEL_49:
  v23 = [NSNumber numberWithUnsignedInt:self->_shadowEvaluationNumberOfSessions];
  [v3 setObject:v23 forKey:@"shadowEvaluationNumberOfSessions"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_51;
  }
LABEL_50:
  v24 = [NSNumber numberWithUnsignedInt:self->_shadowEvaluationNumberOfDaysWithSessions];
  [v3 setObject:v24 forKey:@"shadowEvaluationNumberOfDaysWithSessions"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(float *)&double v4 = self->_prodUIEvaluationSuccessAt1;
  v25 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v25 forKey:@"prodUIEvaluationSuccessAt1"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(float *)&double v4 = self->_prodUIEvaluationSuccessAt2;
  v26 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v26 forKey:@"prodUIEvaluationSuccessAt2"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(float *)&double v4 = self->_prodUIEvaluationSuccessAt4;
  v27 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v27 forKey:@"prodUIEvaluationSuccessAt4"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(float *)&double v4 = self->_prodUIEvaluationSuccessAt8;
  v28 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v28 forKey:@"prodUIEvaluationSuccessAt8"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(float *)&double v4 = self->_prodUIEvaluationMRR;
  v29 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v29 forKey:@"prodUIEvaluationMRR"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_24;
    }
    goto LABEL_57;
  }
LABEL_56:
  v30 = [NSNumber numberWithUnsignedInt:self->_prodUIEvaluationNumberOfSessionsWithPredictions];
  [v3 setObject:v30 forKey:@"prodUIEvaluationNumberOfSessionsWithPredictions"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_58;
  }
LABEL_57:
  v31 = [NSNumber numberWithUnsignedInt:self->_prodUIEvaluationNumberOfSessions];
  [v3 setObject:v31 forKey:@"prodUIEvaluationNumberOfSessions"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_59;
  }
LABEL_58:
  v32 = [NSNumber numberWithUnsignedInt:self->_prodUIEvaluationNumberOfDaysWithSessions];
  [v3 setObject:v32 forKey:@"prodUIEvaluationNumberOfDaysWithSessions"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(float *)&double v4 = self->_prodShadowEvaluationSuccessAt1;
  v33 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v33 forKey:@"prodShadowEvaluationSuccessAt1"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(float *)&double v4 = self->_prodShadowEvaluationSuccessAt2;
  v34 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v34 forKey:@"prodShadowEvaluationSuccessAt2"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(float *)&double v4 = self->_prodShadowEvaluationSuccessAt4;
  v35 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v35 forKey:@"prodShadowEvaluationSuccessAt4"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(float *)&double v4 = self->_prodShadowEvaluationSuccessAt8;
  v36 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v36 forKey:@"prodShadowEvaluationSuccessAt8"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_31;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(float *)&double v4 = self->_prodShadowEvaluationMRR;
  v37 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v37 forKey:@"prodShadowEvaluationMRR"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_32;
    }
LABEL_65:
    v39 = [NSNumber numberWithUnsignedInt:self->_prodShadowEvaluationNumberOfSessions];
    [v3 setObject:v39 forKey:@"prodShadowEvaluationNumberOfSessions"];

    if ((*(_DWORD *)&self->_has & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_64:
  v38 = [NSNumber numberWithUnsignedInt:self->_prodShadowEvaluationNumberOfSessionsWithPredictions];
  [v3 setObject:v38 forKey:@"prodShadowEvaluationNumberOfSessionsWithPredictions"];

  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0) {
    goto LABEL_65;
  }
LABEL_32:
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_33:
    v6 = [NSNumber numberWithUnsignedInt:self->_prodShadowEvaluationNumberOfDaysWithSessions];
    [v3 setObject:v6 forKey:@"prodShadowEvaluationNumberOfDaysWithSessions"];
  }
LABEL_34:
  id v7 = v3;

  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return ATXCandidateRelevanceModelPBEvaluationMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    PBDataWriterWriteFloatField();
    $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_31;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteFloatField();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 2) != 0) {
LABEL_33:
  }
    PBDataWriterWriteUint32Field();
LABEL_34:
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    v4[30] = LODWORD(self->_uiEvaluationSuccessAt1);
    v4[34] |= 0x10000000u;
    $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  v4[31] = LODWORD(self->_uiEvaluationSuccessAt2);
  v4[34] |= 0x20000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  v4[32] = LODWORD(self->_uiEvaluationSuccessAt4);
  v4[34] |= 0x40000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  v4[33] = LODWORD(self->_uiEvaluationSuccessAt8);
  v4[34] |= 0x80000000;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  v4[26] = LODWORD(self->_uiEvaluationMRR);
  v4[34] |= 0x1000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  v4[29] = self->_uiEvaluationNumberOfSessionsWithPredictions;
  v4[34] |= 0x8000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  v4[28] = self->_uiEvaluationNumberOfSessions;
  v4[34] |= 0x4000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  v4[27] = self->_uiEvaluationNumberOfDaysWithSessions;
  v4[34] |= 0x2000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  v4[22] = LODWORD(self->_shadowEvaluationSuccessAt1);
  v4[34] |= 0x100000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  v4[23] = LODWORD(self->_shadowEvaluationSuccessAt2);
  v4[34] |= 0x200000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  v4[24] = LODWORD(self->_shadowEvaluationSuccessAt4);
  v4[34] |= 0x400000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  v4[25] = LODWORD(self->_shadowEvaluationSuccessAt8);
  v4[34] |= 0x800000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  v4[18] = LODWORD(self->_shadowEvaluationMRR);
  v4[34] |= 0x10000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  v4[21] = self->_shadowEvaluationNumberOfSessionsWithPredictions;
  v4[34] |= 0x80000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  v4[20] = self->_shadowEvaluationNumberOfSessions;
  v4[34] |= 0x40000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  v4[19] = self->_shadowEvaluationNumberOfDaysWithSessions;
  v4[34] |= 0x20000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  v4[14] = LODWORD(self->_prodUIEvaluationSuccessAt1);
  v4[34] |= 0x1000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  v4[15] = LODWORD(self->_prodUIEvaluationSuccessAt2);
  v4[34] |= 0x2000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  v4[16] = LODWORD(self->_prodUIEvaluationSuccessAt4);
  v4[34] |= 0x4000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  v4[17] = LODWORD(self->_prodUIEvaluationSuccessAt8);
  v4[34] |= 0x8000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  v4[10] = LODWORD(self->_prodUIEvaluationMRR);
  v4[34] |= 0x100u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  v4[13] = self->_prodUIEvaluationNumberOfSessionsWithPredictions;
  v4[34] |= 0x800u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  v4[12] = self->_prodUIEvaluationNumberOfSessions;
  v4[34] |= 0x400u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  v4[11] = self->_prodUIEvaluationNumberOfDaysWithSessions;
  v4[34] |= 0x200u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_62;
  }
LABEL_61:
  v4[6] = LODWORD(self->_prodShadowEvaluationSuccessAt1);
  v4[34] |= 0x10u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_63;
  }
LABEL_62:
  v4[7] = LODWORD(self->_prodShadowEvaluationSuccessAt2);
  v4[34] |= 0x20u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_64;
  }
LABEL_63:
  v4[8] = LODWORD(self->_prodShadowEvaluationSuccessAt4);
  v4[34] |= 0x40u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_65;
  }
LABEL_64:
  v4[9] = LODWORD(self->_prodShadowEvaluationSuccessAt8);
  v4[34] |= 0x80u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_31;
    }
    goto LABEL_66;
  }
LABEL_65:
  v4[2] = LODWORD(self->_prodShadowEvaluationMRR);
  v4[34] |= 1u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_67;
  }
LABEL_66:
  v4[5] = self->_prodShadowEvaluationNumberOfSessionsWithPredictions;
  v4[34] |= 8u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_67:
  v4[4] = self->_prodShadowEvaluationNumberOfSessions;
  v4[34] |= 4u;
  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_33:
    v4[3] = self->_prodShadowEvaluationNumberOfDaysWithSessions;
    v4[34] |= 2u;
  }
LABEL_34:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    *(float *)(v4 + 120) = self->_uiEvaluationSuccessAt1;
    *(_DWORD *)(v4 + 136) |= 0x10000000u;
    $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 124) = self->_uiEvaluationSuccessAt2;
  *(_DWORD *)(v4 + 136) |= 0x20000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(float *)(v4 + 128) = self->_uiEvaluationSuccessAt4;
  *(_DWORD *)(v4 + 136) |= 0x40000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(float *)(v4 + 132) = self->_uiEvaluationSuccessAt8;
  *(_DWORD *)(v4 + 136) |= 0x80000000;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(float *)(v4 + 104) = self->_uiEvaluationMRR;
  *(_DWORD *)(v4 + 136) |= 0x1000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v4 + 116) = self->_uiEvaluationNumberOfSessionsWithPredictions;
  *(_DWORD *)(v4 + 136) |= 0x8000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v4 + 112) = self->_uiEvaluationNumberOfSessions;
  *(_DWORD *)(v4 + 136) |= 0x4000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v4 + 108) = self->_uiEvaluationNumberOfDaysWithSessions;
  *(_DWORD *)(v4 + 136) |= 0x2000000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(float *)(v4 + 88) = self->_shadowEvaluationSuccessAt1;
  *(_DWORD *)(v4 + 136) |= 0x100000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(float *)(v4 + 92) = self->_shadowEvaluationSuccessAt2;
  *(_DWORD *)(v4 + 136) |= 0x200000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(float *)(v4 + 96) = self->_shadowEvaluationSuccessAt4;
  *(_DWORD *)(v4 + 136) |= 0x400000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(float *)(v4 + 100) = self->_shadowEvaluationSuccessAt8;
  *(_DWORD *)(v4 + 136) |= 0x800000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(float *)(v4 + 72) = self->_shadowEvaluationMRR;
  *(_DWORD *)(v4 + 136) |= 0x10000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v4 + 84) = self->_shadowEvaluationNumberOfSessionsWithPredictions;
  *(_DWORD *)(v4 + 136) |= 0x80000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v4 + 80) = self->_shadowEvaluationNumberOfSessions;
  *(_DWORD *)(v4 + 136) |= 0x40000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v4 + 76) = self->_shadowEvaluationNumberOfDaysWithSessions;
  *(_DWORD *)(v4 + 136) |= 0x20000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(float *)(v4 + 56) = self->_prodUIEvaluationSuccessAt1;
  *(_DWORD *)(v4 + 136) |= 0x1000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(float *)(v4 + 60) = self->_prodUIEvaluationSuccessAt2;
  *(_DWORD *)(v4 + 136) |= 0x2000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(float *)(v4 + 64) = self->_prodUIEvaluationSuccessAt4;
  *(_DWORD *)(v4 + 136) |= 0x4000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(float *)(v4 + 68) = self->_prodUIEvaluationSuccessAt8;
  *(_DWORD *)(v4 + 136) |= 0x8000u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(float *)(v4 + 40) = self->_prodUIEvaluationMRR;
  *(_DWORD *)(v4 + 136) |= 0x100u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_24;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v4 + 52) = self->_prodUIEvaluationNumberOfSessionsWithPredictions;
  *(_DWORD *)(v4 + 136) |= 0x800u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v4 + 48) = self->_prodUIEvaluationNumberOfSessions;
  *(_DWORD *)(v4 + 136) |= 0x400u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v4 + 44) = self->_prodUIEvaluationNumberOfDaysWithSessions;
  *(_DWORD *)(v4 + 136) |= 0x200u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(float *)(v4 + 24) = self->_prodShadowEvaluationSuccessAt1;
  *(_DWORD *)(v4 + 136) |= 0x10u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(float *)(v4 + 28) = self->_prodShadowEvaluationSuccessAt2;
  *(_DWORD *)(v4 + 136) |= 0x20u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(float *)(v4 + 32) = self->_prodShadowEvaluationSuccessAt4;
  *(_DWORD *)(v4 + 136) |= 0x40u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(float *)(v4 + 36) = self->_prodShadowEvaluationSuccessAt8;
  *(_DWORD *)(v4 + 136) |= 0x80u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_31;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(float *)(v4 + 8) = self->_prodShadowEvaluationMRR;
  *(_DWORD *)(v4 + 136) |= 1u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_32;
    }
LABEL_65:
    *(_DWORD *)(v4 + 16) = self->_prodShadowEvaluationNumberOfSessions;
    *(_DWORD *)(v4 + 136) |= 4u;
    if ((*(_DWORD *)&self->_has & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_64:
  *(_DWORD *)(v4 + 20) = self->_prodShadowEvaluationNumberOfSessionsWithPredictions;
  *(_DWORD *)(v4 + 136) |= 8u;
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0) {
    goto LABEL_65;
  }
LABEL_32:
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_33:
    *(_DWORD *)(v4 + 12) = self->_prodShadowEvaluationNumberOfDaysWithSessions;
    *(_DWORD *)(v4 + 136) |= 2u;
  }
LABEL_34:
  id v6 = (id)v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_162;
  }
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  int v6 = *((_DWORD *)v4 + 34);
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_uiEvaluationSuccessAt1 != *((float *)v4 + 30)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_uiEvaluationSuccessAt2 != *((float *)v4 + 31)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_uiEvaluationSuccessAt4 != *((float *)v4 + 32)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_uiEvaluationSuccessAt8 != *((float *)v4 + 33)) {
      goto LABEL_162;
    }
  }
  else if (v6 < 0)
  {
LABEL_162:
    BOOL v7 = 0;
    goto LABEL_163;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_uiEvaluationMRR != *((float *)v4 + 26)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_uiEvaluationNumberOfSessionsWithPredictions != *((_DWORD *)v4 + 29)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_uiEvaluationNumberOfSessions != *((_DWORD *)v4 + 28)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_uiEvaluationNumberOfDaysWithSessions != *((_DWORD *)v4 + 27)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_shadowEvaluationSuccessAt1 != *((float *)v4 + 22)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_shadowEvaluationSuccessAt2 != *((float *)v4 + 23)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_shadowEvaluationSuccessAt4 != *((float *)v4 + 24)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_shadowEvaluationSuccessAt8 != *((float *)v4 + 25)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_shadowEvaluationMRR != *((float *)v4 + 18)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_shadowEvaluationNumberOfSessionsWithPredictions != *((_DWORD *)v4 + 21)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_shadowEvaluationNumberOfSessions != *((_DWORD *)v4 + 20)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_shadowEvaluationNumberOfDaysWithSessions != *((_DWORD *)v4 + 19)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_prodUIEvaluationSuccessAt1 != *((float *)v4 + 14)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_prodUIEvaluationSuccessAt2 != *((float *)v4 + 15)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_prodUIEvaluationSuccessAt4 != *((float *)v4 + 16)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_prodUIEvaluationSuccessAt8 != *((float *)v4 + 17)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_prodUIEvaluationMRR != *((float *)v4 + 10)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_prodUIEvaluationNumberOfSessionsWithPredictions != *((_DWORD *)v4 + 13)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_prodUIEvaluationNumberOfSessions != *((_DWORD *)v4 + 12)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_prodUIEvaluationNumberOfDaysWithSessions != *((_DWORD *)v4 + 11)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_prodShadowEvaluationSuccessAt1 != *((float *)v4 + 6)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_prodShadowEvaluationSuccessAt2 != *((float *)v4 + 7)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_prodShadowEvaluationSuccessAt4 != *((float *)v4 + 8)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_prodShadowEvaluationSuccessAt8 != *((float *)v4 + 9)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_162;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_prodShadowEvaluationMRR != *((float *)v4 + 2)) {
      goto LABEL_162;
    }
  }
  else if (v6)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_prodShadowEvaluationNumberOfSessionsWithPredictions != *((_DWORD *)v4 + 5)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_prodShadowEvaluationNumberOfSessions != *((_DWORD *)v4 + 4)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_prodShadowEvaluationNumberOfDaysWithSessions != *((_DWORD *)v4 + 3)) {
      goto LABEL_162;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (*((_DWORD *)v4 + 34) & 2) == 0;
  }
LABEL_163:

  return v7;
}

- (unint64_t)hash
{
  $5AB72B52232868EB22FCB063F65FE071 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    float uiEvaluationSuccessAt1 = self->_uiEvaluationSuccessAt1;
    float v6 = -uiEvaluationSuccessAt1;
    if (uiEvaluationSuccessAt1 >= 0.0) {
      float v6 = self->_uiEvaluationSuccessAt1;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    float uiEvaluationSuccessAt2 = self->_uiEvaluationSuccessAt2;
    float v11 = -uiEvaluationSuccessAt2;
    if (uiEvaluationSuccessAt2 >= 0.0) {
      float v11 = self->_uiEvaluationSuccessAt2;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    float uiEvaluationSuccessAt4 = self->_uiEvaluationSuccessAt4;
    float v16 = -uiEvaluationSuccessAt4;
    if (uiEvaluationSuccessAt4 >= 0.0) {
      float v16 = self->_uiEvaluationSuccessAt4;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    float uiEvaluationSuccessAt8 = self->_uiEvaluationSuccessAt8;
    float v21 = -uiEvaluationSuccessAt8;
    if (uiEvaluationSuccessAt8 >= 0.0) {
      float v21 = self->_uiEvaluationSuccessAt8;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    float uiEvaluationMRR = self->_uiEvaluationMRR;
    float v26 = -uiEvaluationMRR;
    if (uiEvaluationMRR >= 0.0) {
      float v26 = self->_uiEvaluationMRR;
    }
    float v27 = floorf(v26 + 0.5);
    float v28 = (float)(v26 - v27) * 1.8447e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    uint64_t v125 = 2654435761 * self->_uiEvaluationNumberOfSessionsWithPredictions;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
LABEL_43:
      uint64_t v124 = 2654435761 * self->_uiEvaluationNumberOfSessions;
      if ((*(_DWORD *)&has & 0x2000000) != 0) {
        goto LABEL_44;
      }
LABEL_51:
      uint64_t v123 = 0;
      if ((*(_DWORD *)&has & 0x100000) != 0) {
        goto LABEL_45;
      }
LABEL_52:
      unint64_t v33 = 0;
      goto LABEL_53;
    }
  }
  else
  {
    uint64_t v125 = 0;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_43;
    }
  }
  uint64_t v124 = 0;
  if ((*(_DWORD *)&has & 0x2000000) == 0) {
    goto LABEL_51;
  }
LABEL_44:
  uint64_t v123 = 2654435761 * self->_uiEvaluationNumberOfDaysWithSessions;
  if ((*(_DWORD *)&has & 0x100000) == 0) {
    goto LABEL_52;
  }
LABEL_45:
  float shadowEvaluationSuccessAt1 = self->_shadowEvaluationSuccessAt1;
  float v30 = -shadowEvaluationSuccessAt1;
  if (shadowEvaluationSuccessAt1 >= 0.0) {
    float v30 = self->_shadowEvaluationSuccessAt1;
  }
  float v31 = floorf(v30 + 0.5);
  float v32 = (float)(v30 - v31) * 1.8447e19;
  unint64_t v33 = 2654435761u * (unint64_t)fmodf(v31, 1.8447e19);
  if (v32 >= 0.0)
  {
    if (v32 > 0.0) {
      v33 += (unint64_t)v32;
    }
  }
  else
  {
    v33 -= (unint64_t)fabsf(v32);
  }
LABEL_53:
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    float shadowEvaluationSuccessAt2 = self->_shadowEvaluationSuccessAt2;
    float v36 = -shadowEvaluationSuccessAt2;
    if (shadowEvaluationSuccessAt2 >= 0.0) {
      float v36 = self->_shadowEvaluationSuccessAt2;
    }
    float v37 = floorf(v36 + 0.5);
    float v38 = (float)(v36 - v37) * 1.8447e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    unint64_t v138 = 0;
    goto LABEL_72;
  }
  float shadowEvaluationSuccessAt4 = self->_shadowEvaluationSuccessAt4;
  float v40 = -shadowEvaluationSuccessAt4;
  if (shadowEvaluationSuccessAt4 >= 0.0) {
    float v40 = self->_shadowEvaluationSuccessAt4;
  }
  float v41 = floorf(v40 + 0.5);
  float v42 = (float)(v40 - v41) * 1.8447e19;
  unint64_t v43 = 2654435761u * (unint64_t)fmodf(v41, 1.8447e19);
  if (v42 >= 0.0)
  {
    unint64_t v138 = v43;
    if (v42 <= 0.0) {
      goto LABEL_72;
    }
    unint64_t v44 = v43 + (unint64_t)v42;
  }
  else
  {
    unint64_t v44 = v43 - (unint64_t)fabsf(v42);
  }
  unint64_t v138 = v44;
LABEL_72:
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    unint64_t v137 = 0;
    goto LABEL_81;
  }
  float shadowEvaluationSuccessAt8 = self->_shadowEvaluationSuccessAt8;
  float v46 = -shadowEvaluationSuccessAt8;
  if (shadowEvaluationSuccessAt8 >= 0.0) {
    float v46 = self->_shadowEvaluationSuccessAt8;
  }
  float v47 = floorf(v46 + 0.5);
  float v48 = (float)(v46 - v47) * 1.8447e19;
  unint64_t v49 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
  if (v48 >= 0.0)
  {
    unint64_t v137 = v49;
    if (v48 <= 0.0) {
      goto LABEL_81;
    }
    unint64_t v50 = v49 + (unint64_t)v48;
  }
  else
  {
    unint64_t v50 = v49 - (unint64_t)fabsf(v48);
  }
  unint64_t v137 = v50;
LABEL_81:
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    unint64_t v136 = 0;
    goto LABEL_90;
  }
  float shadowEvaluationMRR = self->_shadowEvaluationMRR;
  float v52 = -shadowEvaluationMRR;
  if (shadowEvaluationMRR >= 0.0) {
    float v52 = self->_shadowEvaluationMRR;
  }
  float v53 = floorf(v52 + 0.5);
  float v54 = (float)(v52 - v53) * 1.8447e19;
  unint64_t v55 = 2654435761u * (unint64_t)fmodf(v53, 1.8447e19);
  if (v54 >= 0.0)
  {
    unint64_t v136 = v55;
    if (v54 <= 0.0) {
      goto LABEL_90;
    }
    unint64_t v56 = v55 + (unint64_t)v54;
  }
  else
  {
    unint64_t v56 = v55 - (unint64_t)fabsf(v54);
  }
  unint64_t v136 = v56;
LABEL_90:
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    uint64_t v122 = 2654435761 * self->_shadowEvaluationNumberOfSessionsWithPredictions;
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
LABEL_92:
      uint64_t v121 = 2654435761 * self->_shadowEvaluationNumberOfSessions;
      if ((*(_DWORD *)&has & 0x20000) != 0) {
        goto LABEL_93;
      }
      goto LABEL_100;
    }
  }
  else
  {
    uint64_t v122 = 0;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_92;
    }
  }
  uint64_t v121 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_93:
    uint64_t v120 = 2654435761 * self->_shadowEvaluationNumberOfDaysWithSessions;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_94;
    }
LABEL_101:
    unint64_t v135 = 0;
    goto LABEL_105;
  }
LABEL_100:
  uint64_t v120 = 0;
  if ((*(_WORD *)&has & 0x1000) == 0) {
    goto LABEL_101;
  }
LABEL_94:
  float prodUIEvaluationSuccessAt1 = self->_prodUIEvaluationSuccessAt1;
  float v58 = -prodUIEvaluationSuccessAt1;
  if (prodUIEvaluationSuccessAt1 >= 0.0) {
    float v58 = self->_prodUIEvaluationSuccessAt1;
  }
  float v59 = floorf(v58 + 0.5);
  float v60 = (float)(v58 - v59) * 1.8447e19;
  float v61 = fmodf(v59, 1.8447e19);
  if (v60 >= 0.0)
  {
    unint64_t v135 = 2654435761u * (unint64_t)v61;
    if (v60 <= 0.0) {
      goto LABEL_105;
    }
    unint64_t v62 = v135 + (unint64_t)v60;
  }
  else
  {
    unint64_t v62 = 2654435761u * (unint64_t)v61 - (unint64_t)fabsf(v60);
  }
  unint64_t v135 = v62;
LABEL_105:
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
    unint64_t v134 = 0;
    goto LABEL_114;
  }
  float prodUIEvaluationSuccessAt2 = self->_prodUIEvaluationSuccessAt2;
  float v64 = -prodUIEvaluationSuccessAt2;
  if (prodUIEvaluationSuccessAt2 >= 0.0) {
    float v64 = self->_prodUIEvaluationSuccessAt2;
  }
  float v65 = floorf(v64 + 0.5);
  float v66 = (float)(v64 - v65) * 1.8447e19;
  float v67 = fmodf(v65, 1.8447e19);
  if (v66 >= 0.0)
  {
    unint64_t v134 = 2654435761u * (unint64_t)v67;
    if (v66 <= 0.0) {
      goto LABEL_114;
    }
    unint64_t v68 = v134 + (unint64_t)v66;
  }
  else
  {
    unint64_t v68 = 2654435761u * (unint64_t)v67 - (unint64_t)fabsf(v66);
  }
  unint64_t v134 = v68;
LABEL_114:
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
    unint64_t v133 = 0;
    goto LABEL_123;
  }
  float prodUIEvaluationSuccessAt4 = self->_prodUIEvaluationSuccessAt4;
  float v70 = -prodUIEvaluationSuccessAt4;
  if (prodUIEvaluationSuccessAt4 >= 0.0) {
    float v70 = self->_prodUIEvaluationSuccessAt4;
  }
  float v71 = floorf(v70 + 0.5);
  float v72 = (float)(v70 - v71) * 1.8447e19;
  float v73 = fmodf(v71, 1.8447e19);
  if (v72 >= 0.0)
  {
    unint64_t v133 = 2654435761u * (unint64_t)v73;
    if (v72 <= 0.0) {
      goto LABEL_123;
    }
    unint64_t v74 = v133 + (unint64_t)v72;
  }
  else
  {
    unint64_t v74 = 2654435761u * (unint64_t)v73 - (unint64_t)fabsf(v72);
  }
  unint64_t v133 = v74;
LABEL_123:
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
    unint64_t v132 = 0;
    goto LABEL_132;
  }
  float prodUIEvaluationSuccessAt8 = self->_prodUIEvaluationSuccessAt8;
  float v76 = -prodUIEvaluationSuccessAt8;
  if (prodUIEvaluationSuccessAt8 >= 0.0) {
    float v76 = self->_prodUIEvaluationSuccessAt8;
  }
  float v77 = floorf(v76 + 0.5);
  float v78 = (float)(v76 - v77) * 1.8447e19;
  float v79 = fmodf(v77, 1.8447e19);
  if (v78 >= 0.0)
  {
    unint64_t v132 = 2654435761u * (unint64_t)v79;
    if (v78 <= 0.0) {
      goto LABEL_132;
    }
    unint64_t v80 = v132 + (unint64_t)v78;
  }
  else
  {
    unint64_t v80 = 2654435761u * (unint64_t)v79 - (unint64_t)fabsf(v78);
  }
  unint64_t v132 = v80;
LABEL_132:
  unint64_t v130 = v4;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
    unint64_t v131 = 0;
    goto LABEL_141;
  }
  float prodUIEvaluationMRR = self->_prodUIEvaluationMRR;
  float v82 = -prodUIEvaluationMRR;
  if (prodUIEvaluationMRR >= 0.0) {
    float v82 = self->_prodUIEvaluationMRR;
  }
  float v83 = floorf(v82 + 0.5);
  float v84 = (float)(v82 - v83) * 1.8447e19;
  float v85 = fmodf(v83, 1.8447e19);
  if (v84 >= 0.0)
  {
    unint64_t v131 = 2654435761u * (unint64_t)v85;
    if (v84 <= 0.0) {
      goto LABEL_141;
    }
    unint64_t v86 = v131 + (unint64_t)v84;
  }
  else
  {
    unint64_t v86 = 2654435761u * (unint64_t)v85 - (unint64_t)fabsf(v84);
  }
  unint64_t v131 = v86;
LABEL_141:
  if ((*(_WORD *)&has & 0x800) == 0)
  {
    uint64_t v119 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_143;
    }
LABEL_146:
    uint64_t v127 = 0;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_144;
    }
    goto LABEL_147;
  }
  uint64_t v119 = 2654435761 * self->_prodUIEvaluationNumberOfSessionsWithPredictions;
  if ((*(_WORD *)&has & 0x400) == 0) {
    goto LABEL_146;
  }
LABEL_143:
  uint64_t v127 = 2654435761 * self->_prodUIEvaluationNumberOfSessions;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_144:
    uint64_t v126 = 2654435761 * self->_prodUIEvaluationNumberOfDaysWithSessions;
    goto LABEL_148;
  }
LABEL_147:
  uint64_t v126 = 0;
LABEL_148:
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    float prodShadowEvaluationSuccessAt1 = self->_prodShadowEvaluationSuccessAt1;
    float v89 = -prodShadowEvaluationSuccessAt1;
    if (prodShadowEvaluationSuccessAt1 >= 0.0) {
      float v89 = self->_prodShadowEvaluationSuccessAt1;
    }
    float v90 = floorf(v89 + 0.5);
    float v91 = (float)(v89 - v90) * 1.8447e19;
    unint64_t v87 = 2654435761u * (unint64_t)fmodf(v90, 1.8447e19);
    if (v91 >= 0.0)
    {
      if (v91 > 0.0) {
        v87 += (unint64_t)v91;
      }
    }
    else
    {
      v87 -= (unint64_t)fabsf(v91);
    }
  }
  else
  {
    unint64_t v87 = 0;
  }
  unint64_t v129 = v9;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    float prodShadowEvaluationSuccessAt2 = self->_prodShadowEvaluationSuccessAt2;
    float v94 = -prodShadowEvaluationSuccessAt2;
    if (prodShadowEvaluationSuccessAt2 >= 0.0) {
      float v94 = self->_prodShadowEvaluationSuccessAt2;
    }
    float v95 = floorf(v94 + 0.5);
    float v96 = (float)(v94 - v95) * 1.8447e19;
    unint64_t v92 = 2654435761u * (unint64_t)fmodf(v95, 1.8447e19);
    if (v96 >= 0.0)
    {
      if (v96 > 0.0) {
        v92 += (unint64_t)v96;
      }
    }
    else
    {
      v92 -= (unint64_t)fabsf(v96);
    }
  }
  else
  {
    unint64_t v92 = 0;
  }
  unint64_t v128 = v87;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    unint64_t v97 = v33;
    unint64_t v98 = v14;
    float prodShadowEvaluationSuccessAt4 = self->_prodShadowEvaluationSuccessAt4;
    float v101 = -prodShadowEvaluationSuccessAt4;
    if (prodShadowEvaluationSuccessAt4 >= 0.0) {
      float v101 = self->_prodShadowEvaluationSuccessAt4;
    }
    float v102 = floorf(v101 + 0.5);
    float v103 = (float)(v101 - v102) * 1.8447e19;
    unint64_t v99 = 2654435761u * (unint64_t)fmodf(v102, 1.8447e19);
    if (v103 >= 0.0)
    {
      if (v103 > 0.0) {
        v99 += (unint64_t)v103;
      }
    }
    else
    {
      v99 -= (unint64_t)fabsf(v103);
    }
  }
  else
  {
    unint64_t v97 = v33;
    unint64_t v98 = v14;
    unint64_t v99 = 0;
  }
  unint64_t v104 = v19;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    float prodShadowEvaluationSuccessAt8 = self->_prodShadowEvaluationSuccessAt8;
    float v107 = -prodShadowEvaluationSuccessAt8;
    if (prodShadowEvaluationSuccessAt8 >= 0.0) {
      float v107 = self->_prodShadowEvaluationSuccessAt8;
    }
    float v108 = floorf(v107 + 0.5);
    float v109 = (float)(v107 - v108) * 1.8447e19;
    unint64_t v105 = 2654435761u * (unint64_t)fmodf(v108, 1.8447e19);
    if (v109 >= 0.0)
    {
      if (v109 > 0.0) {
        v105 += (unint64_t)v109;
      }
    }
    else
    {
      v105 -= (unint64_t)fabsf(v109);
    }
  }
  else
  {
    unint64_t v105 = 0;
  }
  if (*(unsigned char *)&has)
  {
    float prodShadowEvaluationMRR = self->_prodShadowEvaluationMRR;
    float v112 = -prodShadowEvaluationMRR;
    if (prodShadowEvaluationMRR >= 0.0) {
      float v112 = self->_prodShadowEvaluationMRR;
    }
    float v113 = floorf(v112 + 0.5);
    float v114 = (float)(v112 - v113) * 1.8447e19;
    unint64_t v110 = 2654435761u * (unint64_t)fmodf(v113, 1.8447e19);
    if (v114 >= 0.0)
    {
      if (v114 > 0.0) {
        v110 += (unint64_t)v114;
      }
    }
    else
    {
      v110 -= (unint64_t)fabsf(v114);
    }
  }
  else
  {
    unint64_t v110 = 0;
  }
  if ((*(unsigned char *)&has & 8) == 0)
  {
    uint64_t v115 = 0;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_190;
    }
LABEL_193:
    uint64_t v116 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_191;
    }
LABEL_194:
    uint64_t v117 = 0;
    return v129 ^ v130 ^ v98 ^ v104 ^ v24 ^ v125 ^ v124 ^ v123 ^ v97 ^ v34 ^ v138 ^ v137 ^ v136 ^ v122 ^ v121 ^ v120 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v119 ^ v127 ^ v126 ^ v128 ^ v92 ^ v99 ^ v105 ^ v110 ^ v115 ^ v116 ^ v117;
  }
  uint64_t v115 = 2654435761 * self->_prodShadowEvaluationNumberOfSessionsWithPredictions;
  if ((*(unsigned char *)&has & 4) == 0) {
    goto LABEL_193;
  }
LABEL_190:
  uint64_t v116 = 2654435761 * self->_prodShadowEvaluationNumberOfSessions;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_194;
  }
LABEL_191:
  uint64_t v117 = 2654435761 * self->_prodShadowEvaluationNumberOfDaysWithSessions;
  return v129 ^ v130 ^ v98 ^ v104 ^ v24 ^ v125 ^ v124 ^ v123 ^ v97 ^ v34 ^ v138 ^ v137 ^ v136 ^ v122 ^ v121 ^ v120 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v119 ^ v127 ^ v126 ^ v128 ^ v92 ^ v99 ^ v105 ^ v110 ^ v115 ^ v116 ^ v117;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x10000000) != 0)
  {
    self->_float uiEvaluationSuccessAt1 = *((float *)v4 + 30);
    *(_DWORD *)&self->_has |= 0x10000000u;
    int v5 = *((_DWORD *)v4 + 34);
    if ((v5 & 0x20000000) == 0)
    {
LABEL_3:
      if ((v5 & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((v5 & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  self->_float uiEvaluationSuccessAt2 = *((float *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x20000000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_float uiEvaluationSuccessAt4 = *((float *)v4 + 32);
  *(_DWORD *)&self->_has |= 0x40000000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_float uiEvaluationSuccessAt8 = *((float *)v4 + 33);
  *(_DWORD *)&self->_has |= 0x80000000;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_float uiEvaluationMRR = *((float *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_uiEvaluationNumberOfSessionsWithPredictions = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_uiEvaluationNumberOfSessions = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_uiEvaluationNumberOfDaysWithSessions = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x100000) == 0)
  {
LABEL_10:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_float shadowEvaluationSuccessAt1 = *((float *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x200000) == 0)
  {
LABEL_11:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_float shadowEvaluationSuccessAt2 = *((float *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x400000) == 0)
  {
LABEL_12:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_float shadowEvaluationSuccessAt4 = *((float *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x800000) == 0)
  {
LABEL_13:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_float shadowEvaluationSuccessAt8 = *((float *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x10000) == 0)
  {
LABEL_14:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_float shadowEvaluationMRR = *((float *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x80000) == 0)
  {
LABEL_15:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_shadowEvaluationNumberOfSessionsWithPredictions = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x40000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_shadowEvaluationNumberOfSessions = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x20000) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_shadowEvaluationNumberOfDaysWithSessions = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_float prodUIEvaluationSuccessAt1 = *((float *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x2000) == 0)
  {
LABEL_19:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_float prodUIEvaluationSuccessAt2 = *((float *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x4000) == 0)
  {
LABEL_20:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_float prodUIEvaluationSuccessAt4 = *((float *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x8000) == 0)
  {
LABEL_21:
    if ((v5 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_float prodUIEvaluationSuccessAt8 = *((float *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x100) == 0)
  {
LABEL_22:
    if ((v5 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_float prodUIEvaluationMRR = *((float *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x800) == 0)
  {
LABEL_23:
    if ((v5 & 0x400) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_prodUIEvaluationNumberOfSessionsWithPredictions = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x400) == 0)
  {
LABEL_24:
    if ((v5 & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_prodUIEvaluationNumberOfSessions = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x200) == 0)
  {
LABEL_25:
    if ((v5 & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_prodUIEvaluationNumberOfDaysWithSessions = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x10) == 0)
  {
LABEL_26:
    if ((v5 & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_float prodShadowEvaluationSuccessAt1 = *((float *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x20) == 0)
  {
LABEL_27:
    if ((v5 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_float prodShadowEvaluationSuccessAt2 = *((float *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x40) == 0)
  {
LABEL_28:
    if ((v5 & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_float prodShadowEvaluationSuccessAt4 = *((float *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x80) == 0)
  {
LABEL_29:
    if ((v5 & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_float prodShadowEvaluationSuccessAt8 = *((float *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 1) == 0)
  {
LABEL_30:
    if ((v5 & 8) == 0) {
      goto LABEL_31;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_float prodShadowEvaluationMRR = *((float *)v4 + 2);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 8) == 0)
  {
LABEL_31:
    if ((v5 & 4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_prodShadowEvaluationNumberOfSessionsWithPredictions = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 4) == 0)
  {
LABEL_32:
    if ((v5 & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_67:
  self->_prodShadowEvaluationNumberOfSessions = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)v4 + 34) & 2) != 0)
  {
LABEL_33:
    self->_prodShadowEvaluationNumberOfDaysWithSessions = *((_DWORD *)v4 + 3);
    *(_DWORD *)&self->_has |= 2u;
  }
LABEL_34:
}

- (float)uiEvaluationSuccessAt1
{
  return self->_uiEvaluationSuccessAt1;
}

- (float)uiEvaluationSuccessAt2
{
  return self->_uiEvaluationSuccessAt2;
}

- (float)uiEvaluationSuccessAt4
{
  return self->_uiEvaluationSuccessAt4;
}

- (float)uiEvaluationSuccessAt8
{
  return self->_uiEvaluationSuccessAt8;
}

- (float)uiEvaluationMRR
{
  return self->_uiEvaluationMRR;
}

- (unsigned)uiEvaluationNumberOfSessionsWithPredictions
{
  return self->_uiEvaluationNumberOfSessionsWithPredictions;
}

- (unsigned)uiEvaluationNumberOfSessions
{
  return self->_uiEvaluationNumberOfSessions;
}

- (unsigned)uiEvaluationNumberOfDaysWithSessions
{
  return self->_uiEvaluationNumberOfDaysWithSessions;
}

- (float)shadowEvaluationSuccessAt1
{
  return self->_shadowEvaluationSuccessAt1;
}

- (float)shadowEvaluationSuccessAt2
{
  return self->_shadowEvaluationSuccessAt2;
}

- (float)shadowEvaluationSuccessAt4
{
  return self->_shadowEvaluationSuccessAt4;
}

- (float)shadowEvaluationSuccessAt8
{
  return self->_shadowEvaluationSuccessAt8;
}

- (float)shadowEvaluationMRR
{
  return self->_shadowEvaluationMRR;
}

- (unsigned)shadowEvaluationNumberOfSessionsWithPredictions
{
  return self->_shadowEvaluationNumberOfSessionsWithPredictions;
}

- (unsigned)shadowEvaluationNumberOfSessions
{
  return self->_shadowEvaluationNumberOfSessions;
}

- (unsigned)shadowEvaluationNumberOfDaysWithSessions
{
  return self->_shadowEvaluationNumberOfDaysWithSessions;
}

- (float)prodUIEvaluationSuccessAt1
{
  return self->_prodUIEvaluationSuccessAt1;
}

- (float)prodUIEvaluationSuccessAt2
{
  return self->_prodUIEvaluationSuccessAt2;
}

- (float)prodUIEvaluationSuccessAt4
{
  return self->_prodUIEvaluationSuccessAt4;
}

- (float)prodUIEvaluationSuccessAt8
{
  return self->_prodUIEvaluationSuccessAt8;
}

- (float)prodUIEvaluationMRR
{
  return self->_prodUIEvaluationMRR;
}

- (unsigned)prodUIEvaluationNumberOfSessionsWithPredictions
{
  return self->_prodUIEvaluationNumberOfSessionsWithPredictions;
}

- (unsigned)prodUIEvaluationNumberOfSessions
{
  return self->_prodUIEvaluationNumberOfSessions;
}

- (unsigned)prodUIEvaluationNumberOfDaysWithSessions
{
  return self->_prodUIEvaluationNumberOfDaysWithSessions;
}

- (float)prodShadowEvaluationSuccessAt1
{
  return self->_prodShadowEvaluationSuccessAt1;
}

- (float)prodShadowEvaluationSuccessAt2
{
  return self->_prodShadowEvaluationSuccessAt2;
}

- (float)prodShadowEvaluationSuccessAt4
{
  return self->_prodShadowEvaluationSuccessAt4;
}

- (float)prodShadowEvaluationSuccessAt8
{
  return self->_prodShadowEvaluationSuccessAt8;
}

- (float)prodShadowEvaluationMRR
{
  return self->_prodShadowEvaluationMRR;
}

- (unsigned)prodShadowEvaluationNumberOfSessionsWithPredictions
{
  return self->_prodShadowEvaluationNumberOfSessionsWithPredictions;
}

- (unsigned)prodShadowEvaluationNumberOfSessions
{
  return self->_prodShadowEvaluationNumberOfSessions;
}

- (unsigned)prodShadowEvaluationNumberOfDaysWithSessions
{
  return self->_prodShadowEvaluationNumberOfDaysWithSessions;
}

@end