@interface GTShaderProfilerAnalyzeBinaryLLVM
@end

@implementation GTShaderProfilerAnalyzeBinaryLLVM

void __GTShaderProfilerAnalyzeBinaryLLVM_block_invoke(id a1)
{
  LLVMInitializeAGX2TargetInfo();
  LLVMInitializeAGX2TargetMC();
  LLVMInitializeAGX2Disassembler();

  LLVMInitializeAGX2ClauseAnalyzer();
}

@end