@interface VNCCCharBoxContext
- (BOOL)makeAllocationsForWidth:(unint64_t)a3;
- (char)pulseVectorHeightCharBox;
- (char)pulseVectorHeightCharBoxAdaptive;
- (float)bBottom;
- (float)bTop;
- (float)floatVectorSumProd;
- (float)mBottom;
- (float)mTop;
- (float)posLL;
- (float)posLR;
- (float)posUL;
- (float)posUR;
- (signed)loopBigBox;
- (signed)loopBigBoxPrev;
- (unint64_t)charBoxFlags;
- (unsigned)allocationSize;
- (unsigned)charboxROIFullVectorHeight2;
- (unsigned)charboxROIFullVectorRowStart;
- (unsigned)checkFlag:(unint64_t)a3 atIndex:(unsigned int)a4;
- (unsigned)filterWalkUpDownCount;
- (unsigned)medianHeightBottom;
- (unsigned)medianHeightTop;
- (void)clearFlag:(unint64_t)a3 atIndex:(unsigned int)a4;
- (void)copyFlagValue:(unint64_t)a3 toTarget:(unint64_t)a4 atIndex:(unsigned int)a5;
- (void)dealloc;
- (void)releaseAllocations;
- (void)resetBoxBounds;
- (void)setAllocationSize:(unsigned int)a3;
- (void)setBBottom:(float)a3;
- (void)setBTop:(float)a3;
- (void)setCharBoxFlags:(unint64_t *)a3;
- (void)setCharboxROIFullVectorHeight2:(unsigned __int16 *)a3;
- (void)setCharboxROIFullVectorRowStart:(unsigned __int16 *)a3;
- (void)setFilterWalkUpDownCount:(unsigned __int16)a3;
- (void)setFlag:(unint64_t)a3 atIndex:(unsigned int)a4;
- (void)setFloatVectorSumProd:(float *)a3;
- (void)setLoopBigBox:(signed __int16)a3;
- (void)setLoopBigBoxPrev:(signed __int16)a3;
- (void)setMBottom:(float)a3;
- (void)setMTop:(float)a3;
- (void)setMedianHeightBottom:(unsigned __int16)a3;
- (void)setMedianHeightTop:(unsigned __int16)a3;
- (void)setPosLL:(float)a3;
- (void)setPosLR:(float)a3;
- (void)setPosUL:(float)a3;
- (void)setPosUR:(float)a3;
- (void)setPulseVectorHeightCharBox:(char *)a3;
- (void)setPulseVectorHeightCharBoxAdaptive:(char *)a3;
@end

@implementation VNCCCharBoxContext

- (void)setFilterWalkUpDownCount:(unsigned __int16)a3
{
  self->filterWalkUpDownCount = a3;
}

- (unsigned)filterWalkUpDownCount
{
  return self->filterWalkUpDownCount;
}

- (void)setLoopBigBoxPrev:(signed __int16)a3
{
  self->loopBigBoxPrev = a3;
}

- (signed)loopBigBoxPrev
{
  return self->loopBigBoxPrev;
}

- (void)setLoopBigBox:(signed __int16)a3
{
  self->loopBigBox = a3;
}

- (signed)loopBigBox
{
  return self->loopBigBox;
}

- (void)setMedianHeightBottom:(unsigned __int16)a3
{
  self->medianHeightBottom = a3;
}

- (unsigned)medianHeightBottom
{
  return self->medianHeightBottom;
}

- (void)setMedianHeightTop:(unsigned __int16)a3
{
  self->medianHeightTop = a3;
}

- (unsigned)medianHeightTop
{
  return self->medianHeightTop;
}

- (void)setPosLR:(float)a3
{
  self->posLR = a3;
}

- (float)posLR
{
  return self->posLR;
}

- (void)setPosUR:(float)a3
{
  self->posUR = a3;
}

- (float)posUR
{
  return self->posUR;
}

- (void)setPosLL:(float)a3
{
  self->posLL = a3;
}

- (float)posLL
{
  return self->posLL;
}

- (void)setPosUL:(float)a3
{
  self->posUL = a3;
}

- (float)posUL
{
  return self->posUL;
}

- (void)setBBottom:(float)a3
{
  self->bBottom = a3;
}

- (float)bBottom
{
  return self->bBottom;
}

- (void)setBTop:(float)a3
{
  self->bTop = a3;
}

- (float)bTop
{
  return self->bTop;
}

- (void)setMBottom:(float)a3
{
  self->mBottom = a3;
}

- (float)mBottom
{
  return self->mBottom;
}

- (void)setMTop:(float)a3
{
  self->mTop = a3;
}

- (float)mTop
{
  return self->mTop;
}

- (void)setAllocationSize:(unsigned int)a3
{
  self->allocationSize = a3;
}

- (unsigned)allocationSize
{
  return self->allocationSize;
}

- (void)setCharboxROIFullVectorHeight2:(unsigned __int16 *)a3
{
  self->charboxROIFullVectorHeight2 = a3;
}

- (unsigned)charboxROIFullVectorHeight2
{
  return self->charboxROIFullVectorHeight2;
}

- (void)setCharboxROIFullVectorRowStart:(unsigned __int16 *)a3
{
  self->charboxROIFullVectorRowStart = a3;
}

- (unsigned)charboxROIFullVectorRowStart
{
  return self->charboxROIFullVectorRowStart;
}

- (void)setCharBoxFlags:(unint64_t *)a3
{
  self->charBoxFlags = a3;
}

- (unint64_t)charBoxFlags
{
  return self->charBoxFlags;
}

- (void)setPulseVectorHeightCharBoxAdaptive:(char *)a3
{
  self->pulseVectorHeightCharBoxAdaptive = a3;
}

- (char)pulseVectorHeightCharBoxAdaptive
{
  return self->pulseVectorHeightCharBoxAdaptive;
}

- (void)setPulseVectorHeightCharBox:(char *)a3
{
  self->pulseVectorHeightCharBox = a3;
}

- (char)pulseVectorHeightCharBox
{
  return self->pulseVectorHeightCharBox;
}

- (void)setFloatVectorSumProd:(float *)a3
{
  self->floatVectorSumProd = a3;
}

- (float)floatVectorSumProd
{
  return self->floatVectorSumProd;
}

- (void)releaseAllocations
{
  self->floatVectorSumProd = 0;
  free(self->pulseVectorHeightCharBox);
  self->pulseVectorHeightCharBox = 0;
  free(self->pulseVectorHeightCharBoxAdaptive);
  self->pulseVectorHeightCharBoxAdaptive = 0;
  free(self->charboxROIFullVectorRowStart);
  self->charboxROIFullVectorRowStart = 0;
  free(self->charboxROIFullVectorHeight2);
  self->charboxROIFullVectorHeight2 = 0;
  free(self->charBoxFlags);
  self->charBoxFlags = 0;
  self->allocationSize = 0;
  *(_DWORD *)&self->loopBigBox = 0;
}

- (BOOL)makeAllocationsForWidth:(unint64_t)a3
{
  [(VNCCCharBoxContext *)self releaseAllocations];
  v5 = (float *)malloc_type_calloc(a3, 4uLL, 0x100004052888210uLL);
  self->floatVectorSumProd = v5;
  if (!v5) {
    goto LABEL_8;
  }
  v6 = (char *)malloc_type_calloc(a3, 1uLL, 0x100004077774924uLL);
  self->pulseVectorHeightCharBox = v6;
  if (!v6) {
    goto LABEL_8;
  }
  v7 = (char *)malloc_type_calloc(a3, 1uLL, 0x100004077774924uLL);
  self->pulseVectorHeightCharBoxAdaptive = v7;
  if (!v7) {
    goto LABEL_8;
  }
  v8 = (unsigned __int16 *)malloc_type_calloc(a3, 2uLL, 0x1000040BDFB0063uLL);
  self->charboxROIFullVectorRowStart = v8;
  if (v8
    && (v9 = (unsigned __int16 *)malloc_type_calloc(a3, 2uLL, 0x1000040BDFB0063uLL),
        (self->charboxROIFullVectorHeight2 = v9) != 0)
    && (v10 = (unint64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL), (self->charBoxFlags = v10) != 0))
  {
    self->allocationSize = a3;
    *(_DWORD *)&self->loopBigBox = 0;
    return 1;
  }
  else
  {
LABEL_8:
    [(VNCCCharBoxContext *)self releaseAllocations];
    return 0;
  }
}

- (void)dealloc
{
  [(VNCCCharBoxContext *)self releaseAllocations];
  v3.receiver = self;
  v3.super_class = (Class)VNCCCharBoxContext;
  [(VNCCCharBoxContext *)&v3 dealloc];
}

- (void)resetBoxBounds
{
  *(_OWORD *)&self->posUL = 0u;
  *(_OWORD *)&self->mTop = 0u;
}

- (void)copyFlagValue:(unint64_t)a3 toTarget:(unint64_t)a4 atIndex:(unsigned int)a5
{
  if ((self->charBoxFlags[a5] & a3) != 0) {
    [(VNCCCharBoxContext *)self setFlag:a4 atIndex:*(void *)&a5];
  }
  else {
    [(VNCCCharBoxContext *)self clearFlag:a4 atIndex:*(void *)&a5];
  }
}

- (unsigned)checkFlag:(unint64_t)a3 atIndex:(unsigned int)a4
{
  return (self->charBoxFlags[a4] & a3) != 0;
}

- (void)clearFlag:(unint64_t)a3 atIndex:(unsigned int)a4
{
  self->charBoxFlags[a4] &= ~a3;
}

- (void)setFlag:(unint64_t)a3 atIndex:(unsigned int)a4
{
  self->charBoxFlags[a4] |= a3;
}

@end