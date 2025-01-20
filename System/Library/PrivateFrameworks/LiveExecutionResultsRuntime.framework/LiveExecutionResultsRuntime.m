uint64_t __builtin_send_data(_:)()
{
  uint64_t result;

  if (_ler_send_log_data) {
    return _ler_send_log_data();
  }
  return result;
}