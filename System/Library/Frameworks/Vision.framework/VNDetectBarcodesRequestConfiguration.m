@interface VNDetectBarcodesRequestConfiguration
- (BOOL)coalesceCompositeSymbologies;
- (BOOL)stopAtFirstPyramidWith2DCode;
- (BOOL)useMLDetector;
- (NSArray)symbologies;
- (NSString)locateMode;
- (VNDetectBarcodesRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCoalesceCompositeSymbologies:(BOOL)a3;
- (void)setDefaultSymbologiesForRevision:(unint64_t)a3;
- (void)setLocateMode:(id)a3;
- (void)setStopAtFirstPyramidWith2DCode:(BOOL)a3;
- (void)setSymbologies:(id)a3;
- (void)setUseMLDetector:(BOOL)a3;
@end

@implementation VNDetectBarcodesRequestConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locateMode, 0);

  objc_storeStrong((id *)&self->_symbologies, 0);
}

- (void)setCoalesceCompositeSymbologies:(BOOL)a3
{
  self->_coalesceCompositeSymbologies = a3;
}

- (BOOL)coalesceCompositeSymbologies
{
  return self->_coalesceCompositeSymbologies;
}

- (void)setUseMLDetector:(BOOL)a3
{
  self->_useMLDetector = a3;
}

- (BOOL)useMLDetector
{
  return self->_useMLDetector;
}

- (void)setStopAtFirstPyramidWith2DCode:(BOOL)a3
{
  self->_stopAtFirstPyramidWith2DCode = a3;
}

- (BOOL)stopAtFirstPyramidWith2DCode
{
  return self->_stopAtFirstPyramidWith2DCode;
}

- (void)setLocateMode:(id)a3
{
}

- (NSString)locateMode
{
  return self->_locateMode;
}

- (void)setSymbologies:(id)a3
{
}

- (NSArray)symbologies
{
  return self->_symbologies;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectBarcodesRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setSymbologies:self->_symbologies];
    [v5 setLocateMode:self->_locateMode];
    [v5 setStopAtFirstPyramidWith2DCode:self->_stopAtFirstPyramidWith2DCode];
    [v5 setUseMLDetector:self->_useMLDetector];
  }
  return v5;
}

- (VNDetectBarcodesRequestConfiguration)initWithRequestClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectBarcodesRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v7 initWithRequestClass:a3];
  id v4 = v3;
  if (v3)
  {
    [(VNDetectBarcodesRequestConfiguration *)v3 setDefaultSymbologiesForRevision:[(VNRequestConfiguration *)v3 resolvedRevision]];
    v5 = v4;
  }

  return v4;
}

- (void)setDefaultSymbologiesForRevision:(unint64_t)a3
{
  if ((uint64_t)a3 <= 3737841663)
  {
    switch(a3)
    {
      case 1uLL:
        v9 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1];
        goto LABEL_12;
      case 2uLL:
        v9 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2];
        goto LABEL_12;
      case 3uLL:
        v10 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3];
        goto LABEL_17;
      case 4uLL:
        v10 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4];
        goto LABEL_17;
      default:
        goto LABEL_13;
    }
  }
  switch(a3)
  {
    case 0xDECAF000uLL:
      v9 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private];
LABEL_12:
      symbologies = self->_symbologies;
      self->_symbologies = v9;

      self->_useMLDetector = 0;
      break;
    case 0xDECAF001uLL:
      v10 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private];
      goto LABEL_17;
    case 0xDECAF002uLL:
      v10 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private];
LABEL_17:
      v13 = self->_symbologies;
      self->_symbologies = v10;

      self->_useMLDetector = 1;
      return;
    default:
LABEL_13:
      VNValidatedLog(4, @"Unable to obtain the supported barcode symbologies", a3, v3, v4, v5, v6, v7, v14);
      v12 = self->_symbologies;
      self->_symbologies = 0;

      break;
  }
}

@end