int main(int argc, const char **argv, const char **envp)
{
  FigCommonMediaProcessInitialization();
  if (VTVideoCodecService_ShouldUseSeparateCodecProcessForDecode()) {
    xpc_main((xpc_connection_handler_t)&VTDecompressionSessionXPCServer_ServiceConnectionHandler);
  }
  FigSignalErrorAt();
  return 0;
}

uint64_t FigCommonMediaProcessInitialization()
{
  return _FigCommonMediaProcessInitialization();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

uint64_t VTVideoCodecService_ShouldUseSeparateCodecProcessForDecode()
{
  return _VTVideoCodecService_ShouldUseSeparateCodecProcessForDecode();
}

void xpc_main(xpc_connection_handler_t handler)
{
}