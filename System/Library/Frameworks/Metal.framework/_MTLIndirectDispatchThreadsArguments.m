@interface _MTLIndirectDispatchThreadsArguments
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerGrid;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerThreadgroup;
- (void)setThreadsPerGrid:(id *)a3;
- (void)setThreadsPerThreadgroup:(id *)a3;
@end

@implementation _MTLIndirectDispatchThreadsArguments

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerGrid
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)&self->var1;
  return self;
}

- (void)setThreadsPerGrid:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_threadsPerGrid.depth = a3->var2;
  *(_OWORD *)&self->_threadsPerGrid.width = v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerThreadgroup
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 32);
  return self;
}

- (void)setThreadsPerThreadgroup:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_threadsPerThreadgroup.depth = a3->var2;
  *(_OWORD *)&self->_threadsPerThreadgroup.width = v3;
}

@end