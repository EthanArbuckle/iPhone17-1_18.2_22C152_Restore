@interface _MTLIndirectDrawMeshThreadgroupsArguments
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadgroupsPerGrid;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerMeshThreadgroup;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerObjectThreadgroup;
- (void)setThreadgroupsPerGrid:(id *)a3;
- (void)setThreadsPerMeshThreadgroup:(id *)a3;
- (void)setThreadsPerObjectThreadgroup:(id *)a3;
@end

@implementation _MTLIndirectDrawMeshThreadgroupsArguments

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadgroupsPerGrid
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 80);
  return self;
}

- (void)setThreadgroupsPerGrid:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_threadgroupsPerGrid.depth = a3->var2;
  *(_OWORD *)&self->_threadgroupsPerGrid.width = v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerObjectThreadgroup
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 104);
  return self;
}

- (void)setThreadsPerObjectThreadgroup:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_threadsPerObjectThreadgroup.depth = a3->var2;
  *(_OWORD *)&self->_threadsPerObjectThreadgroup.width = v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerMeshThreadgroup
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 128);
  return self;
}

- (void)setThreadsPerMeshThreadgroup:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_threadsPerMeshThreadgroup.depth = a3->var2;
  *(_OWORD *)&self->_threadsPerMeshThreadgroup.width = v3;
}

@end