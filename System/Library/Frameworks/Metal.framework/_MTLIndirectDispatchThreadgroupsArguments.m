@interface _MTLIndirectDispatchThreadgroupsArguments
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadgroupsPerGrid;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerThreadgroup;
- (void)setThreadgroupsPerGrid:(id *)a3;
- (void)setThreadsPerThreadgroup:(id *)a3;
@end

@implementation _MTLIndirectDispatchThreadgroupsArguments

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadgroupsPerGrid
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)&self->var1;
  return self;
}

- (void)setThreadgroupsPerGrid:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_threadgroupsPerGrid.depth = a3->var2;
  *(_OWORD *)&self->_threadgroupsPerGrid.width = v3;
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