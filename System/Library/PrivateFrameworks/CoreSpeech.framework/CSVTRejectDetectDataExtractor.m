@interface CSVTRejectDetectDataExtractor
- (CSVTRejectDetectDataExtractor)init;
- (NSMutableArray)hsScores;
- (NSMutableArray)hsTimeDelta;
- (NSMutableArray)jsScores;
- (NSMutableArray)jsTimeDelta;
- (NSMutableArray)spkrIdScores;
- (NSMutableArray)spkrIdTimeDelta;
- (float)hsThreshold;
- (float)jsThreshold;
- (float)phsThreshold;
- (float)pjsThreshold;
- (unint64_t)hsRejectCount;
- (unint64_t)jsRejectCount;
- (unint64_t)spkrIdRejectCount;
- (unint64_t)totalEventCount;
- (void)classifyEventWithMetaData:(id)a3;
- (void)setHsRejectCount:(unint64_t)a3;
- (void)setHsScores:(id)a3;
- (void)setHsThreshold:(float)a3;
- (void)setHsTimeDelta:(id)a3;
- (void)setJsRejectCount:(unint64_t)a3;
- (void)setJsScores:(id)a3;
- (void)setJsThreshold:(float)a3;
- (void)setJsTimeDelta:(id)a3;
- (void)setPhsThreshold:(float)a3;
- (void)setPjsThreshold:(float)a3;
- (void)setSpkrIdRejectCount:(unint64_t)a3;
- (void)setSpkrIdScores:(id)a3;
- (void)setSpkrIdTimeDelta:(id)a3;
@end

@implementation CSVTRejectDetectDataExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spkrIdTimeDelta, 0);
  objc_storeStrong((id *)&self->_jsTimeDelta, 0);
  objc_storeStrong((id *)&self->_hsTimeDelta, 0);
  objc_storeStrong((id *)&self->_spkrIdScores, 0);
  objc_storeStrong((id *)&self->_jsScores, 0);
  objc_storeStrong((id *)&self->_hsScores, 0);
}

- (void)setPjsThreshold:(float)a3
{
  self->_pjsThreshold = a3;
}

- (float)pjsThreshold
{
  return self->_pjsThreshold;
}

- (void)setPhsThreshold:(float)a3
{
  self->_phsThreshold = a3;
}

- (float)phsThreshold
{
  return self->_phsThreshold;
}

- (void)setJsThreshold:(float)a3
{
  self->_jsThreshold = a3;
}

- (float)jsThreshold
{
  return self->_jsThreshold;
}

- (void)setHsThreshold:(float)a3
{
  self->_hsThreshold = a3;
}

- (float)hsThreshold
{
  return self->_hsThreshold;
}

- (void)setSpkrIdTimeDelta:(id)a3
{
}

- (NSMutableArray)spkrIdTimeDelta
{
  return self->_spkrIdTimeDelta;
}

- (void)setJsTimeDelta:(id)a3
{
}

- (NSMutableArray)jsTimeDelta
{
  return self->_jsTimeDelta;
}

- (void)setHsTimeDelta:(id)a3
{
}

- (NSMutableArray)hsTimeDelta
{
  return self->_hsTimeDelta;
}

- (void)setSpkrIdScores:(id)a3
{
}

- (NSMutableArray)spkrIdScores
{
  return self->_spkrIdScores;
}

- (void)setJsScores:(id)a3
{
}

- (NSMutableArray)jsScores
{
  return self->_jsScores;
}

- (void)setHsScores:(id)a3
{
}

- (NSMutableArray)hsScores
{
  return self->_hsScores;
}

- (void)setSpkrIdRejectCount:(unint64_t)a3
{
  self->_spkrIdRejectCount = a3;
}

- (unint64_t)spkrIdRejectCount
{
  return self->_spkrIdRejectCount;
}

- (void)setHsRejectCount:(unint64_t)a3
{
  self->_hsRejectCount = a3;
}

- (unint64_t)hsRejectCount
{
  return self->_hsRejectCount;
}

- (void)setJsRejectCount:(unint64_t)a3
{
  self->_jsRejectCount = a3;
}

- (unint64_t)jsRejectCount
{
  return self->_jsRejectCount;
}

- (unint64_t)totalEventCount
{
  return self->_jsRejectCount + self->_hsRejectCount + self->_spkrIdRejectCount;
}

- (void)classifyEventWithMetaData:(id)a3
{
  id v4 = a3;
  if ([(CSVTRejectDetectDataExtractor *)self totalEventCount] < 0x7D1)
  {
    switch((unint64_t)[v4 eventType])
    {
      case 0uLL:
        ++self->_hsRejectCount;
        hsScores = self->_hsScores;
        [v4 score];
        v7 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [(NSMutableArray *)hsScores addObject:v7];

        hsTimeDelta = self->_hsTimeDelta;
        [v4 deltaTimeFromActivation];
        v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(NSMutableArray *)hsTimeDelta addObject:v9];

        [v4 threshold];
        self->_hsThreshold = v10;
        break;
      case 1uLL:
        ++self->_jsRejectCount;
        jsScores = self->_jsScores;
        [v4 score];
        v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [(NSMutableArray *)jsScores addObject:v12];

        jsTimeDelta = self->_jsTimeDelta;
        [v4 deltaTimeFromActivation];
        v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(NSMutableArray *)jsTimeDelta addObject:v14];

        [v4 threshold];
        self->_jsThreshold = v15;
        break;
      case 2uLL:
        ++self->_spkrIdRejectCount;
        spkrIdScores = self->_spkrIdScores;
        [v4 score];
        v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [(NSMutableArray *)spkrIdScores addObject:v17];

        spkrIdTimeDelta = self->_spkrIdTimeDelta;
        [v4 deltaTimeFromActivation];
        v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(NSMutableArray *)spkrIdTimeDelta addObject:v19];

        [v4 threshold];
        self->_phsThreshold = v20;
        break;
      case 3uLL:
        ++self->_spkrIdRejectCount;
        v21 = self->_spkrIdScores;
        [v4 score];
        v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [(NSMutableArray *)v21 addObject:v22];

        v23 = self->_spkrIdTimeDelta;
        [v4 deltaTimeFromActivation];
        v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(NSMutableArray *)v23 addObject:v24];

        [v4 threshold];
        self->_pjsThreshold = v25;
        break;
      default:
        break;
    }
  }
  else
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315138;
      v27 = "-[CSVTRejectDetectDataExtractor classifyEventWithMetaData:]";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Exceeded max entries, ignoring entry", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (CSVTRejectDetectDataExtractor)init
{
  v17.receiver = self;
  v17.super_class = (Class)CSVTRejectDetectDataExtractor;
  v2 = [(CSVTRejectDetectDataExtractor *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_jsRejectCount = 0;
    v2->_hsRejectCount = 0;
    v2->_spkrIdRejectCount = 0;
    uint64_t v4 = +[NSMutableArray array];
    hsScores = v3->_hsScores;
    v3->_hsScores = (NSMutableArray *)v4;

    uint64_t v6 = +[NSMutableArray array];
    jsScores = v3->_jsScores;
    v3->_jsScores = (NSMutableArray *)v6;

    uint64_t v8 = +[NSMutableArray array];
    spkrIdScores = v3->_spkrIdScores;
    v3->_spkrIdScores = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableArray array];
    hsTimeDelta = v3->_hsTimeDelta;
    v3->_hsTimeDelta = (NSMutableArray *)v10;

    uint64_t v12 = +[NSMutableArray array];
    jsTimeDelta = v3->_jsTimeDelta;
    v3->_jsTimeDelta = (NSMutableArray *)v12;

    uint64_t v14 = +[NSMutableArray array];
    spkrIdTimeDelta = v3->_spkrIdTimeDelta;
    v3->_spkrIdTimeDelta = (NSMutableArray *)v14;
  }
  return v3;
}

@end