@interface GTMTLDecodeIndirectRenderCommandBuffer
@end

@implementation GTMTLDecodeIndirectRenderCommandBuffer

void __GTMTLDecodeIndirectRenderCommandBuffer_block_invoke_45(id a1)
{
  if (s_logUsingOsLog)
  {
    v1 = gt_default_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&def_1C1270, v1, OS_LOG_TYPE_ERROR, "warning: Cannot decode ICB mesh buffer binding, missing SPI", buf, 2u);
    }
  }
  else
  {
    v2 = __stderrp;
    id v3 = +[NSString stringWithFormat:@"warning: Cannot decode ICB mesh buffer binding, missing SPI"];
    fprintf(v2, "%s\n", (const char *)[v3 UTF8String]);
  }
}

void __GTMTLDecodeIndirectRenderCommandBuffer_block_invoke(id a1)
{
  if (s_logUsingOsLog)
  {
    v1 = gt_default_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&def_1C1270, v1, OS_LOG_TYPE_ERROR, "warning: Cannot decode ICB object buffer binding, missing SPI", buf, 2u);
    }
  }
  else
  {
    v2 = __stderrp;
    id v3 = +[NSString stringWithFormat:@"warning: Cannot decode ICB object buffer binding, missing SPI"];
    fprintf(v2, "%s\n", (const char *)[v3 UTF8String]);
  }
}

@end