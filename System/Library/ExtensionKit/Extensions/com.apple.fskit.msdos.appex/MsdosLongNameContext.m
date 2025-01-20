@interface MsdosLongNameContext
- (BOOL)isValid;
- (MsdosLongNameContext)init;
- (unsigned)checkSum;
- (unsigned)numLongNameEntries;
- (unsigned)numLongNameEntriesLeft;
- (void)fillWithFirstLongNameEntry:(winentry *)a3;
- (void)invalidate;
- (void)setCheckSum:(unsigned __int8)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setNumLongNameEntries:(unsigned int)a3;
- (void)setNumLongNameEntriesLeft:(unsigned int)a3;
@end

@implementation MsdosLongNameContext

- (MsdosLongNameContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)MsdosLongNameContext;
  v2 = [(MsdosLongNameContext *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MsdosLongNameContext *)v2 setNumLongNameEntries:0];
    [(MsdosLongNameContext *)v3 setNumLongNameEntriesLeft:0];
    [(MsdosLongNameContext *)v3 setCheckSum:0];
    [(MsdosLongNameContext *)v3 setIsValid:0];
  }
  return v3;
}

- (void)fillWithFirstLongNameEntry:(winentry *)a3
{
  [(MsdosLongNameContext *)self setNumLongNameEntries:a3->var0 & 0x3F];
  [(MsdosLongNameContext *)self setNumLongNameEntriesLeft:[(MsdosLongNameContext *)self numLongNameEntries]];
  [(MsdosLongNameContext *)self setCheckSum:a3->var4];

  [(MsdosLongNameContext *)self setIsValid:1];
}

- (void)invalidate
{
  [(MsdosLongNameContext *)self setNumLongNameEntries:0];
  [(MsdosLongNameContext *)self setNumLongNameEntriesLeft:0];
  [(MsdosLongNameContext *)self setCheckSum:0];

  [(MsdosLongNameContext *)self setIsValid:0];
}

- (unsigned)numLongNameEntries
{
  return self->_numLongNameEntries;
}

- (void)setNumLongNameEntries:(unsigned int)a3
{
  self->_numLongNameEntries = a3;
}

- (unsigned)numLongNameEntriesLeft
{
  return self->_numLongNameEntriesLeft;
}

- (void)setNumLongNameEntriesLeft:(unsigned int)a3
{
  self->_numLongNameEntriesLeft = a3;
}

- (unsigned)checkSum
{
  return self->_checkSum;
}

- (void)setCheckSum:(unsigned __int8)a3
{
  self->_checkSum = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

@end